import 'package:dartz/dartz.dart';
import 'package:project_2/data_layer/failures/main_failiure.dart';

import '../../../model/login_response_model.dart';

abstract class ILoginRepo {
  Future<Either<MainFailure, LoginResponse>> loginUser({
    required String email,
    required String password,
  });
}
