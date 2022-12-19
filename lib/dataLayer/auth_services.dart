import 'package:http/http.dart' as http;
import 'package:project_2/dataLayer/model/response.dart';
import 'package:project_2/dataLayer/model/signupmodel.dart';

class Authsevices {
  Future<String?> register({required SignupModel model}) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:5000/api/v1/auth/register'),
        body: model.toJson(),
      );
      print(response.body);
      return SignupResponse().signupModelFromJson(response.body).message;
    } catch (e) {
      rethrow;
      // e;
      // log(e.toString());
    }
  }
}
