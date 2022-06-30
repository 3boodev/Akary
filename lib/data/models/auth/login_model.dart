import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

class LoginModel {
  LoginModel({
    required this.jwt,
    required this.user,
  });

  String jwt;
  User user;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
