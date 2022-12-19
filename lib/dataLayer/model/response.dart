// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';



class SignupResponse {
  SignupResponse({
    this.message,
  });

  String? message;

  factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
      };
      SignupResponse signupModelFromJson(String str) =>
      SignupResponse.fromJson(json.decode(str));

  String signupModelToJson(SignupResponse data) => json.encode(data.toJson());
}
