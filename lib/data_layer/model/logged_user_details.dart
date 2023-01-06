// To parse this JSON data, do
//
//     final loggedUserModel = loggedUserModelFromJson(jsonString);

import 'dart:convert';



class LoggedUserModel {
  LoggedUserModel({
    this.id,
    this.name,
    this.email,
    this.followers,
    this.following,
    this.v,
    this.profilePic,
  });

  String? id;
  String? name;
  String? email;
  List<LoggedUserModelFollower>? followers;
  List<LoggedUserModelFollowing>? following;
  int ?v;
  String? profilePic;

  factory LoggedUserModel.fromJson(Map<String, dynamic> json) =>
      LoggedUserModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        followers: List<LoggedUserModelFollower>.from(
            json["followers"].map((x) => LoggedUserModelFollower.fromJson(x))),
        following: List<LoggedUserModelFollowing>.from(
            json["following"].map((x) => LoggedUserModelFollowing.fromJson(x))),
        v: json["__v"],
        profilePic: json["profilePic"],
      );



  LoggedUserModel loggedUserModelFromJson(String str) =>
      LoggedUserModel.fromJson(json.decode(str));


}

class LoggedUserModelFollower {
  LoggedUserModelFollower({
    this.follower,
    this.id,
  });

  Follow? follower;
  String? id;

  factory LoggedUserModelFollower.fromJson(Map<String, dynamic> json) =>
      LoggedUserModelFollower(
        follower: Follow.fromJson(json["follower"]),
        id: json["_id"],
      );


}

class Follow {
  Follow({
    this.id,
    this.name,
    this.email,
    this.password,
    this.refreshToken,
    this.followers,
    this.following,
    this.v,
    this.profilePic,
  });

  String? id;
  String? name;
  String? email;
  String? password;
  List<String>? refreshToken;
  List<FollowerFollower>? followers;
  List<FollowerFollowing>? following;
  int? v;
  String ?profilePic;

  factory Follow.fromJson(Map<String, dynamic> json) => Follow(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        refreshToken: List<String>.from(json["refreshToken"].map((x) => x)),
        followers: List<FollowerFollower>.from(
            json["followers"].map((x) => FollowerFollower.fromJson(x))),
        following: List<FollowerFollowing>.from(
            json["following"].map((x) => FollowerFollowing.fromJson(x))),
        v: json["__v"],
        profilePic: json["profilePic"],
      );


}

class FollowerFollower {
  FollowerFollower({
    this.follower,
    this.id,
  });

  String? follower;
  String? id;

  factory FollowerFollower.fromJson(Map<String, dynamic> json) =>
      FollowerFollower(
        follower: json["follower"],
        id: json["_id"],
      );


}

class FollowerFollowing {
  FollowerFollowing({
    this.follow,
    this.id,
  });

  String? follow;
  String? id;

  factory FollowerFollowing.fromJson(Map<String, dynamic> json) =>
      FollowerFollowing(
        follow: json["follow"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "follow": follow,
        "_id": id,
      };
}

class LoggedUserModelFollowing {
  LoggedUserModelFollowing({
    this.follow,
    this.id,
  });

  Follow? follow;
  String? id;

  factory LoggedUserModelFollowing.fromJson(Map<String, dynamic> json) =>
      LoggedUserModelFollowing(
        follow: Follow.fromJson(json["follow"]),
        id: json["_id"],
      );


}



