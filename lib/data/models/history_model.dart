class HistoryModel {
  HistoryModel({
    required this.data,
    required this.error,
    required this.status,
  });

  final List<History> data;
  final String error;
  final String status;

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        data: List<History>.from(json["data"].map((x) => History.fromJson(x))),
        error: json["error"],
        status: json["status"],
      );
}

class History {
  History({
    required this.accuracy,
    required this.id,
    required this.image,
    required this.name,
  });

  final String accuracy;
  final int id;
  final String image;
  final String name;

  factory History.fromJson(Map<String, dynamic> json) => History(
        accuracy: json["accuracy"],
        id: json["id"],
        image: json["image"],
        name: json["name"],
      );
}
