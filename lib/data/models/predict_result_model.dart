class PredictResultModel {
  PredictResultModel({
    required this.diagnosis,
    required this.email,
    required this.image,
    required this.probability,
    required this.status,
  });

  String? diagnosis;
  String? email;
  String? image;
  String? probability;
  int? status;

  factory PredictResultModel.fromJson(Map<String, dynamic> json) =>
      PredictResultModel(
        diagnosis: json["diagnosis"] ?? '',
        email: json["email"] ?? '',
        image: json["image"] ?? '',
        probability: json["probability"] ?? '',
        status: json["status"] ?? 404,
      );
}
