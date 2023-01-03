// To parse this JSON data, do
//
//     final loggedUserPost = loggedUserPostFromJson(jsonString);

import 'dart:convert';

class LoggedUserPosts {
  LoggedUserPosts({
    this.id,
    this.userid,
    this.image,
    this.caption,
    this.like,
  });

  String? id;
  Userid? userid;
  String? image;
  String? caption;
  List<dynamic>? like;

  factory LoggedUserPosts.fromJson(Map<String, dynamic> json) => LoggedUserPosts(
        id: json["_id"],
        userid: Userid.fromJson(json["userid"]),
        image: json["image"],
        caption: json["caption"],
        like: List<dynamic>.from(json["Like"].map((x) => x)),
      );

  // Map<String, dynamic> toJson() => {
  //       "_id": id,
  //       "userid": userid.toJson(),
  //       "image": image,
  //       "caption": caption,
  //       "Like": List<dynamic>.from(like.map((x) => x)),
  //       "__v": v,
  //     };

  List<LoggedUserPosts> loggedUserPostsFromJson(String str) =>
      List<LoggedUserPosts>.from(
          json.decode(str).map((x) => LoggedUserPosts.fromJson(x)));

  // String loggedUserPostToJson(List<LoggedUserPost> data) =>
  //     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class Userid {
  Userid({
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
  List<Following>? following;

  String? profilePic;

  factory Userid.fromJson(Map<String, dynamic> json) => Userid(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
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
  //       "followers": List<dynamic>.from(followers.map((x) => x.toJson())),
  //       "following": List<dynamic>.from(following.map((x) => x.toJson())),

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
