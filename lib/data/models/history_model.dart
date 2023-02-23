import 'dart:convert';

HistoryModel historyModelFromJson(String str) =>
    HistoryModel.fromJson(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
  HistoryModel({
    required this.data,
  });

  final List<History> data;

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        data: List<History>.from(json["data"].map((x) => History.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class History {
  History({
    required this.accuracy,
    required this.error,
    required this.id,
    required this.image,
    required this.name,
  });

  final String accuracy;
  final String error;
  final int id;
  final String image;
  final String name;

  factory History.fromJson(Map<String, dynamic> json) => History(
        accuracy: json["accuracy"],
        error: json["error"],
        id: json["id"],
        image: json["image"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "accuracy": accuracy,
        "error": error,
        "id": id,
        "image": image,
        "name": name,
      };
}
