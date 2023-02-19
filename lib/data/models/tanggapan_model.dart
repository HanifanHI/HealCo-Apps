import 'dart:convert';

TanggapanModel tanggapanModelFromJson(String str) =>
    TanggapanModel.fromJson(json.decode(str));

String tanggapanModelToJson(TanggapanModel data) => json.encode(data.toJson());

class TanggapanModel {
  TanggapanModel({
    required this.message,
  });

  final String message;

  factory TanggapanModel.fromJson(Map<String, dynamic> json) => TanggapanModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
