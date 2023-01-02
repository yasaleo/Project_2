// To parse this JSON data, do
//
//     final loggedUserDetails = loggedUserDetailsFromJson(jsonString);

import 'dart:convert';



class LoggedUserDetails {
  LoggedUserDetails({
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
  List<dynamic>? followers;
  List<dynamic>? following;

  String ?profilePic;

  factory LoggedUserDetails.fromJson(Map<String, dynamic> json) =>
      LoggedUserDetails(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        followers: json["followers"] == null
            ? null
            : List<dynamic>.from(json["followers"].map((x) => x)),
        following: json["following"] == null
            ? null
            : List<dynamic>.from(json["following"].map((x) => x)),
        profilePic: json["profilePic"] == null ? null : json["profilePic"],
      );

      LoggedUserDetails loggedUserDetailsFromJson(String str) =>
      LoggedUserDetails.fromJson(json.decode(str));

// String loggedUserDetailsToJson(LoggedUserDetails data) =>
//     json.encode(data.toJson());

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
  //       "profilePic": profilePic == null ? null : profilePic,
  //     };
}
