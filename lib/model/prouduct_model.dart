// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.productId,
    required this.name,
    required this.quantity,
    required this.image,
    required this.expDate,
    required this.description,
    required this.price,
    required this.views,
    required this.userId,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  int productId;
  String name;
  int quantity;
  String image;
  DateTime expDate;
  dynamic description;
  int price;
  int views;
  int userId;
  int categoryId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"],
    name: json["name"],
    quantity: json["quantity"],
    image: json["image"],
    expDate: DateTime.parse(json["exp_date"]),
    description: json["description"],
    price: json["price"],
    views: json["views"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "name": name,
    "quantity": quantity,
    "image": image,
    "exp_date": "${expDate.year.toString().padLeft(4, '0')}-${expDate.month.toString().padLeft(2, '0')}-${expDate.day.toString().padLeft(2, '0')}",
    "description": description,
    "price": price,
    "views": views,
    "user_id": userId,
    "category_id": categoryId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
