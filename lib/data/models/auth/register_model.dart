import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

class RegisterModel {
  RegisterModel({
    required this.jwt,
    required this.user,
  });

  String jwt;
  User user;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        jwt: json["jwt"],
        user: User.fromJson(json["user"]),
      );
}

class User {
  User({
    required this.id,
    required this.username,
    required this.email,
  });

  int id;
  String username;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
      );
}
