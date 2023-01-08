import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:project_2/data_layer/model/likes_model.dart';
import 'package:project_2/data_layer/model/logged_user_details.dart';
import 'package:project_2/data_layer/model/login_response_model.dart';
import 'package:project_2/data_layer/model/signupmodel.dart';
import 'package:project_2/presentation/widgets/constants/constants.dart';

import '../model/get_comment.dart';
import '../model/get_post_model.dart';
import '../model/logged_user_postlist.dart';
import '../model/search_model.dart';

class Repositories {
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

  //__________________GET Logged userDetails_____________________________________________
  Future<LoggedUserModel> getLoggedUserDetails() async {
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

      final details = LoggedUserModel().loggedUserModelFromJson(response.body);

      log(details.followers![0].follower!.email!);

      return details;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<LoggedUserPosts>> getLoggedUserPosts({required String id}) async {
    final token = Constants.ACCESSTOKEN;

    Map<String, String>? headers = {
      "Authorization": "Bearer $token",
    };
    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl/user/$id/post',
        ),
        headers: headers,
      );
      log(" post list with id status code ${response.statusCode}");

      final details = LoggedUserPosts().loggedUserPostsFromJson(response.body);

      return details;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addComment({required String id, required String comment}) async {
    final token = Constants.ACCESSTOKEN;

    Map<String, String>? headers = {
      "Authorization": "Bearer $token",
    };
    try {
      final response = await http.post(
          Uri.parse(
            '$baseUrl/post/$id/comments',
          ),
          headers: headers,
          body: {"comment": comment});
      log(" post list with id status code ${response.statusCode}");

      // final details = LoggedUserPosts().loggedUserPostsFromJson(response.body);

      // return details;
    } catch (e) {
      rethrow;
    }
  }

  Future<GetCommentModel> getComments({
    required String id,
  }) async {
    final token = Constants.ACCESSTOKEN;

    Map<String, String>? headers = {
      "Authorization": "Bearer $token",
    };
    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl/post/$id/comments',
        ),
        headers: headers,
      );
      log(" comment list with id status code ${response.statusCode}");

      final comments = GetCommentModel().getCommentModelFromJson(response.body);

      return comments;
    } catch (e) {
      rethrow;
    }
  }

  Future<LikesModel> addLike({
    required String id,
  }) async {
    final token = Constants.ACCESSTOKEN;

    Map<String, String>? headers = {
      "Authorization": "Bearer $token",
    };
    try {
      final response = await http.post(
        Uri.parse(
          '$baseUrl/post/$id/likes',
        ),
        headers: headers,
      );
      log(" likes with id status code ${response.statusCode}");

      final likes = LikesModel().likesModelFromJson(response.body);

      return likes;
    } catch (e) {
      rethrow;
    }
  }

  Future<LikesModel> getLikeCount({
    required String id,
  }) async {
    final token = Constants.ACCESSTOKEN;

    Map<String, String>? headers = {
      "Authorization": "Bearer $token",
    };
    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl/post/$id/likes',
        ),
        headers: headers,
      );
      log(" likes with id status code ${response.statusCode}");

      final likes = LikesModel().likesModelFromJson(response.body);
      log(likes.count.toString());

      return likes;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SearchModel>> searchProfile({required String query}) async {
    final token = Constants.ACCESSTOKEN;

    Map<String, String>? headers = {
      "Authorization": "Bearer $token",
    };
    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl/user?search=$query',
        ),
        headers: headers,
      );
      log(" search with query status code ${response.statusCode}");

      final searchlist = SearchModel().searchModelFromJson(response.body);
      log(searchlist.length.toString());

      return searchlist;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> folowRequest({required String id}) async {
    final token = Constants.ACCESSTOKEN;
    log("starteeedddddddd");

    Map<String, String>? headers = {
      "Authorization": "Bearer $token",
    };
    try {
      final response = await http.post(
        Uri.parse(
          '$baseUrl/user/$id/follow',
        ),
        headers: headers,
      );
      log(" follow with id status code ${response.statusCode}");

      // final searchlist = SearchModel().searchModelFromJson(response.body);
      // log(searchlist.length.toString());

      // return searchlist;
    } catch (e) {
      rethrow;
    }
  }
}
