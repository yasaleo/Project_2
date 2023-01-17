import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:project_2/data_layer/model/login_response_model.dart';
import 'package:project_2/data_layer/failures/main_failiure.dart';
import 'package:dartz/dartz.dart';
import 'package:project_2/data_layer/repositeries/authrepo/login/i_login_repo.dart';
import 'package:http/http.dart' as http;

import '../../../constants/api_routes.dart';

@LazySingleton(as: ILoginRepo)
class LoginRepo implements ILoginRepo {
  @override
  Future<Either<MainFailure, LoginResponse>> loginUser(
      {required String email, required String password}) async {
    try {
    log("request called");

      final response = await http.post(
          Uri.parse('${ApiRoutes.baseUrl}/auth/login'),
          body: {"email": email, "password": password});
      log(response.statusCode.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = LoginResponse().loginResponseFromJson(response.body);
        return right(result);
      } else {
        return left(const MainFailure.serverFailure(message: " server error found"));
      }
    } catch (_) {
      return left(const MainFailure.clientFailure(message: 'broo client error'));
    }
  }
}
