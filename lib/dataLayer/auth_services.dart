import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class Authsevices {
  register({
    required String email,
    required String pasword,
    required String firstname,
    required String lastname,
  }) async {
    try {
      final response = await http
          .post(Uri.parse('https://the-babble.ml/accounts/register/'), body: {
        "first_name": firstname,
        "last_name": lastname,
        "email": email,
        "password": pasword,
      });
      log(json.decode(response.body));
    } catch (e) {
      log(e.toString());
    }
  }
}
