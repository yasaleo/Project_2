// To parse this JSON data, do
//
//     final GetPostModel = GetPostModelFromJson(jsonString);

import 'dart:convert';



// String GetPostModelToJson(List<GetPostModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetPostModel {
  GetPostModel({
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
 

  factory GetPostModel.fromJson(Map<String, dynamic> json) => GetPostModel(
        id: json["_id"] == null ? null : json["_id"],
        userid: json["userid"] == null ? null : Userid.fromJson(json["userid"]),
        image: json["image"] == null ? null : json["image"],
        caption: json["caption"] == null ? null : json["caption"],
        like: json["Like"] == null
            ? null
            : List<dynamic>.from(json["Like"].map((x) => x)),
       
      );

  // Map<String, dynamic> toJson() => {
  //       "_id": id == null ? null : id,
  //       "userid": userid == null ? null : userid.toJson(),
  //       "image": image == null ? null : image,
  //       "caption": caption == null ? null : caption,
  //       "Like": like == null ? null : List<dynamic>.from(like.map((x) => x)),
        
  //     };
  List<GetPostModel> GetPostModelFromJson(String str) => List<GetPostModel>.from(
      json.decode(str).map((x) => GetPostModel.fromJson(x)));
}

class Userid {
  Userid({
    this.id,
    this.name,
    this.email,
    this.followers,
    this.following,
    
  });

  String? id;
  String? name;
  String? email;
  List<dynamic>? followers;
  List<dynamic>? following;
 

  factory Userid.fromJson(Map<String, dynamic> json) => Userid(
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
