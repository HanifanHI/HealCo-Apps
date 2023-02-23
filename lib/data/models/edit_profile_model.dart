// To parse this JSON data, do
//
//     final editProfileModel = editProfileModelFromJson(jsonString);

import 'dart:convert';

EditProfileModel editProfileModelFromJson(String str) =>
    EditProfileModel.fromJson(json.decode(str));

String editProfileModelToJson(EditProfileModel data) =>
    json.encode(data.toJson());

class EditProfileModel {
  EditProfileModel({
    required this.error,
    required this.message,
    required this.status,
  });

  final String error;
  final String message;
  final int status;

  factory EditProfileModel.fromJson(Map<String, dynamic> json) =>
      EditProfileModel(
        error: json["error"],
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status": status,
      };
}
