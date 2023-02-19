import 'dart:convert';

List<HistoryModel> historyModelFromJson(String str) => List<HistoryModel>.from(
    json.decode(str).map((x) => HistoryModel.fromJson(x)));

String historyModelToJson(List<HistoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HistoryModel {
  HistoryModel({
    required this.accuracy,
    required this.id,
    required this.image,
    required this.name,
  });

  final String accuracy;
  final int id;
  final String image;
  final String name;

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        accuracy: json["accuracy"],
        id: json["id"],
        image: json["image"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "accuracy": accuracy,
        "id": id,
        "image": image,
        "name": name,
      };
}
