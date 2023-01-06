// To parse this JSON data, do
//
//     final getCommentModel = getCommentModelFromJson(jsonString);

import 'dart:convert';



class GetCommentModel {
  GetCommentModel({
    this.id,
    this.postid,
    this.comments,

  });

  String? id;
  String? postid;
  List<Comment>? comments;


  factory GetCommentModel.fromJson(Map<String, dynamic> json) =>
      GetCommentModel(
        id: json["_id"],
        postid: json["postid"],
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
  
      );

  // Map<String, dynamic> toJson() => {
  //       "_id": id,
  //       "postid": postid,
  //       "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
  //       "__v": v,
  //     };


  GetCommentModel getCommentModelFromJson(String str) =>
      GetCommentModel.fromJson(json.decode(str));

  // String getCommentModelToJson(GetCommentModel data) =>
  //     json.encode(data.toJson());
}

class Comment {
  Comment({
    this.userid,
    this.comment,
    this.id,
  });

  Userid? userid;
  String? comment;
  String? id;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        userid: Userid.fromJson(json["userid"]),
        comment: json["comment"],
        id: json["_id"],
      );

  // Map<String, dynamic> toJson() => {
  //       "userid": userid.toJson(),
  //       "comment": comment,
  //       "_id": id,
  //     };
}

class Userid {
  Userid({
    this.id,
    this.name,
    this.email,
    this.password,
    this.refreshToken,
    this.followers,
    this.following,
  
    this.profilePic,
  });

  String? id;
  String? name;
  String? email;
  String? password;
  List<String>? refreshToken;
  List<Follower> ?followers;
  List<Following> ?following;
  
  String? profilePic;

  factory Userid.fromJson(Map<String, dynamic> json) => Userid(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        refreshToken: List<String>.from(json["refreshToken"].map((x) => x)),
        followers: List<Follower>.from(
            json["followers"].map((x) => Follower.fromJson(x))),
        following: List<Following>.from(
            json["following"].map((x) => Following.fromJson(x))),
       
        profilePic: json["profilePic"],
      );

  // Map<String, dynamic> toJson() => {
  //       "_id": id,
  //       "name": name,
  //       "email": email,
  //       "password": password,
  //       "refreshToken": List<dynamic>.from(refreshToken.map((x) => x)),
  //       "followers": List<dynamic>.from(followers.map((x) => x.toJson())),
  //       "following": List<dynamic>.from(following.map((x) => x.toJson())),
  //       "__v": v,
  //       "profilePic": profilePic,
  //     };
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

  // Map<String, dynamic> toJson() => {
  //       "follower": follower,
  //       "_id": id,
  //     };
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

  // Map<String, dynamic> toJson() => {
  //       "follow": follow,
  //       "_id": id,
  //     };
}
