import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_2/dataLayer/model/signupmodel.dart';
import 'package:project_2/presentation/authentication/signup/otpscreen.dart';
import 'package:project_2/presentation/constants/constants.dart';

class Authsevices {
  //register
  Future<int> register({required SignupModel model, context}) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:5000/api/v1/auth/register'),
        body: model.toJson(),
      );

      final params = {
        "email": model.email,
      };
      final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
      await http.get(Uri.http('10.0.2.2:5000', '/api/v1/auth/otp', params),
          headers: headers);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OtpScreen(email: model.email!),
        ),
      );

      print(response.statusCode);
      return response.statusCode;
    } catch (e) {
      rethrow;
      // e;
      // log(e.toString());
    }
  }

  Future<int> verifyOtp({required String email, required String otp}) async {
    try {
      final response = await http.post(
          Uri.parse('http://10.0.2.2:5000/api/v1/auth/otp'),
          body: {"email": email, "otp": otp});
      print(response.statusCode);
      return response.statusCode;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> login({required String email, required String password}) async {
    try {
      final response = await http.post(
          Uri.parse('http://10.0.2.2:5000/api/v1/auth/login'),
          body: {"email": email, "password": password});
      print(response.statusCode);
      return response.statusCode;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createPost(
      String caption, File file, BuildContext context) async {
    Constants().showLoading(context);
    const postUrl = "http://10.0.2.2:5000/api/v1/post";
    const token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySW5mbyI6eyJpZCI6IjYzYTE2YWY1YzA5ZTFjYjFlNjFiMDBlMSJ9LCJpYXQiOjE2NzIwMzk2NzMsImV4cCI6MTY3MjEyNjA3M30.2F_uKiOOk0wIbD9thlrsGkln6ceUpWFKJdu2f5Rd0Lo";
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
}
