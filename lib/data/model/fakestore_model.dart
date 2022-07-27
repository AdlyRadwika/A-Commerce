import 'dart:convert';

import 'package:flutter/material.dart';

List<FakestoreModel> fakestoreModelFromJson(List<dynamic> json) {
  var data = json.map((e) => FakestoreModel.fromJson(e)).toList();
  return data;
}

String fakestoreModelToJson(List<FakestoreModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<String> fakestoreCategoryFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String fakestoreCategoryToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));

class FakestoreModel {

  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  FakestoreModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory FakestoreModel.fromJson(Map<String, dynamic> json) => FakestoreModel(
    id: json["id"],
    title: json["title"],
    price: json["price"].toDouble(),
    description: json["description"],
    category: json["category"],
    image: json["image"],
    rating: Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "rating": rating.toJson(),
  };
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"].toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}
