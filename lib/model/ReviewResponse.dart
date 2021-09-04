// To parse required this JSON data, do
//
//     final reviewResponse = reviewResponseFromJson(jsonString);

import 'dart:convert';

ReviewResponse reviewResponseFromJson(String str) => ReviewResponse.fromJson(json.decode(str));

String reviewResponseToJson(ReviewResponse data) => json.encode(data.toJson());

class ReviewResponse {
  ReviewResponse({
    required this.results,
  });

  List<ReviewModel> results;


  factory ReviewResponse.fromJson(Map<String, dynamic> json) => ReviewResponse(
    results: List<ReviewModel>.from(json["results"].map((x) => ReviewModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class ReviewModel {
  ReviewModel({
    required this.author,
    required this.content,
  });

  String author;
  String content;

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    author: json["author"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "content": content,
  };
}

