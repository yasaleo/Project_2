// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';



class SearchModel {
  SearchModel({
    this.id,
    this.name,
    this.email,
    this.followers,
    this.following,

    this.profilePic,
  });

  String? id;
  String? name;
  String? email;
  List<Follower>? followers;
  List<Following> ?following;

  String? profilePic;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        followers: List<Follower>.from(
            json["followers"].map((x) => Follower.fromJson(x))),
        following: List<Following>.from(
            json["following"].map((x) => Following.fromJson(x))),
        
        profilePic: json["profilePic"] == null ? null : json["profilePic"],
      );


      List<SearchModel> searchModelFromJson(String str) => List<SearchModel>.from(
      json.decode(str).map((x) => SearchModel.fromJson(x)));

  // String searchModelToJson(List<SearchModel> data) =>
  //     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


}

class Follower {
  Follower({
    this.follower,
    this.id,
  });

  String? follower;
  String? id;

  factory Follower.fromJson(Map<String, dynamic> json) => Follower(
        follower: json["follower"],
        id: json["_id"],
      );


}

class Following {
  Following({
    this.follow,
    this.id,
  });

  String? follow;
  String? id;

  factory Following.fromJson(Map<String, dynamic> json) => Following(
        follow: json["follow"],
        id: json["_id"],
      );


}
