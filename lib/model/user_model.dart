// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.user,
    required this.tokenType,
    required this.accessToken,
  });

  UserClass user;
  String tokenType;
  String accessToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
    user: UserClass.fromJson(json["user"]),
    tokenType: json["token_type"],
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token_type": tokenType,
    "access_token": accessToken,
  };
}

class UserClass {
  UserClass({
    required this.userId,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.facebookUrl,
    required this.whatsappUrl,
    required this.age,
    required this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  int userId;
  String name;
  String email;
  String emailVerifiedAt;
  String facebookUrl;
  String whatsappUrl;
  int age;
  int phoneNumber;
  String createdAt;
  String updatedAt;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
    userId: json["user_id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    facebookUrl: json["facebook_url"],
    whatsappUrl: json["whatsapp_url"],
    age: json["age"],
    phoneNumber: json["phone_number"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "facebook_url": facebookUrl,
    "whatsapp_url": whatsappUrl,
    "age": age,
    "phone_number": phoneNumber,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
