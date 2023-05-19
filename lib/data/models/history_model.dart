class HistoryModel {
  late int? id;
  late String name;
  late String image;
  late String accuracy;

  HistoryModel({
    this.id,
    required this.name,
    required this.image,
    required this.accuracy,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "accuracy": accuracy,
    };
  }

  HistoryModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    image = map['image'];
    accuracy = map['accuracy'];
  }
}
