// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  int id;
  String title;
  String category;
  double rating;
  int selling;
  int price;
  String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.rating,
    required this.selling,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        rating: json["rating"]?.toDouble(),
        selling: json["selling"],
        price: json["price"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category": category,
        "rating": rating,
        "selling": selling,
        "price": price,
        "imageUrl": imageUrl,
      };
}
