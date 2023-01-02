// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';



class LoginResponse {
  LoginResponse({
    this.accessToken,
    this.user,
  });

  String? accessToken;
  User? user;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        accessToken: json["accessToken"] == null ? null : json["accessToken"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "accessToken": accessToken == null ? null : accessToken,
  //       // "user": user == null ? null : user.toJson(),
  //     };
      LoginResponse loginResponseFromJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  // String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.followers,
    this.following,
  });

  String? id;
  String? name;
  String? email;
  List<dynamic> ?followers;
  List<dynamic> ?following;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        followers: json["followers"] == null
            ? null
            : List<dynamic>.from(json["followers"].map((x) => x)),
        following: json["following"] == null
            ? null
            : List<dynamic>.from(json["following"].map((x) => x)),
      );

  // Map<String, dynamic> toJson() => {
  //       "_id": id == null ? null : id,
  //       "name": name == null ? null : name,
  //       "email": email == null ? null : email,
  //       "followers": followers == null
  //           ? null
  //           : List<dynamic>.from(followers.map((x) => x)),
  //       "following": following == null
  //           ? null
  //           : List<dynamic>.from(following.map((x) => x)),
  //       "__v": v == null ? null : v,
  //     };
}
