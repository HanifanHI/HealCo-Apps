import 'dart:convert';

DeleteHistoryModel deleteHistoryModelFromJson(String str) =>
    DeleteHistoryModel.fromJson(json.decode(str));

String deleteHistoryModelToJson(DeleteHistoryModel data) =>
    json.encode(data.toJson());

class DeleteHistoryModel {
  DeleteHistoryModel({
    required this.message,
  });

  final String message;

  factory DeleteHistoryModel.fromJson(Map<String, dynamic> json) =>
      DeleteHistoryModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
