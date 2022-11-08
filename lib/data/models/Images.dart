// To parse this JSON data, do
//
//     final image = imageFromJson(jsonString);

import 'dart:convert';

Image imageFromJson(String str) => Image.fromJson(json.decode(str));

class Image {
  Image({
    this.status,
    this.data,
    this.message,
  });

  String? status;
  Data? data;
  String? message;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );
}

class Data {
  Data({
    this.images,
  });

  List<String>? images;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        images: List<String>.from(json["images"].map((x) => x)),
      );
}
