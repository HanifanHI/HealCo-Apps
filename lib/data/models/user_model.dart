// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.email,
    required this.error,
    required this.id,
    required this.name,
    required this.noHp,
    required this.profile,
  });

  final String email;
  final String error;
  final int id;
  final String name;
  final String noHp;
  final String profile;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        error: json["error"],
        id: json["id"],
        name: json["name"],
        noHp: json["no_hp"],
        profile: json["profile"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "error": error,
        "id": id,
        "name": name,
        "no_hp": noHp,
        "profile": profile,
      };
}
