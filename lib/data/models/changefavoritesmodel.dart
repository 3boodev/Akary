import 'dart:convert';

ChangeFavoritesModel changeFavoritesModelFromJson(String str) =>
    ChangeFavoritesModel.fromJson(json.decode(str));

class ChangeFavoritesModel {
  ChangeFavoritesModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory ChangeFavoritesModel.fromJson(Map<String, dynamic> json) =>
      ChangeFavoritesModel(
        status: json["status"],
        message: json["message"],
      );
}
