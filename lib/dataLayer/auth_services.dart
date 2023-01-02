import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:project_2/dataLayer/model/logged_user_details.dart';
import 'package:project_2/dataLayer/model/login_response_model.dart';
import 'package:project_2/dataLayer/model/signupmodel.dart';
import 'package:project_2/presentation/constants/constants.dart';

import 'model/get_post_model.dart';

class Authsevices {
  final String baseUrl = 'http://172.16.1.253:5000/api/v1';
  //__________________Register_____________________________________________
  Future<int> register({
    required SignupModel model,
    required BuildContext context,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/register'),
        body: model.toJson(),
      );

      final params = {
        "email": model.email,
      };
      final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
      await http.get(Uri.http('10.0.2.2:5000', '/api/v1/auth/otp', params),
          headers: headers);

      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => OtpScreen(email: model.email!),
      //   ),
      // );

      print(response.statusCode);
      return response.statusCode;
    } on SocketException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
      rethrow;
      // e;
      // log(e.toString());
    }
  }
  //__________________verify OTP_____________________________________________

  Future<int> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/auth/otp'),
          body: {"email": email, "otp": otp});
      print(response.statusCode);
      return response.statusCode;
    } catch (e) {
      rethrow;
    }
  }
  //__________________Login_____________________________________________

  Future<LoginResponse> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/auth/login'),
          body: {"email": email, "password": password});
      final userDetails = LoginResponse().loginResponseFromJson(response.body);
      log(response.statusCode.toString());
      // log(userDetails.user!.email.toString());
      return userDetails; //register

    } on SocketException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
      rethrow;
    } on HttpException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
      rethrow;
    } on ClientException catch (e) {
      log("client caught ");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
      rethrow;
    }
  }
  //__________________Create POST_____________________________________________

  Future<void> createPost(
      String caption, File file, BuildContext context) async {
    Constants().showLoading(context);
    final postUrl = "$baseUrl/post";
    final token = Constants.ACCESSTOKEN;
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
    };

    try {
      final res = http.MultipartRequest("POST", Uri.parse(postUrl))
        ..headers.addAll(headers)
        ..fields['caption'] = caption
        ..files.add(http.MultipartFile.fromBytes(
            "image", file.readAsBytesSync(),
            filename: file.path));

      final streamedResponse = await res.send();
      final response = await http.Response.fromStream(streamedResponse);

      log(response.statusCode.toString());

      Navigator.of(context).pop();
    } catch (e) {
      rethrow;
    }
  }

  //__________________GET all POST_____________________________________________

  Future<List<GetPostModel>> getAllUserPost() async {
    final token = Constants.ACCESSTOKEN;

    Map<String, String>? headers = {
      "Authorization": "Bearer $token",
    };
    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl/post',
        ),
        headers: headers,
      );
      log(response.statusCode.toString());
      final post = GetPostModel().GetPostModelFromJson(response.body);

      log(post.length.toString());

      return GetPostModel().GetPostModelFromJson(response.body);
    } catch (e) {
      rethrow;
    }
  }

  Future<LoggedUserDetails> getLoggedUserDetails() async {
    final token = Constants.ACCESSTOKEN;

    Map<String, String>? headers = {
      "Authorization": "Bearer $token",
    };
    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl/profile',
        ),
        headers: headers,
      );
      log(response.statusCode.toString());
      final details =
          LoggedUserDetails().loggedUserDetailsFromJson(response.body);

      log(details.email.toString());

      return details;
    } catch (e) {
      rethrow;
    }
  }
}
