import 'dart:convert';

UserModel? userModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel? data) => json.encode(data!.toJson());

class UserModel {
  UserModel({
    required this.email,
    required this.hoHp,
    required this.name,
    required this.password,
  });

  String email;
  String hoHp;
  String name;
  String password;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        hoHp: json["ho_hp"],
        name: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "ho_hp": hoHp,
        "username": name,
        "password": password,
      };
}
