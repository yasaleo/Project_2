// To parse this JSON data, do
//
//     final likesModel = likesModelFromJson(jsonString);

import 'dart:convert';



class LikesModel {
  LikesModel({
    this.message,
    this.count,
  });

  String? message;
  int ?count;

  factory LikesModel.fromJson(Map<String, dynamic> json) => LikesModel(
        message: json["message"],
        count: json["count"],
      );

  // Map<String, dynamic> toJson() => {
  //       "message": message,
  //       "count": count,
  //     };


  LikesModel likesModelFromJson(String str) =>
      LikesModel.fromJson(json.decode(str));

  // String likesModelToJson(LikesModel data) => json.encode(data.toJson());
}
