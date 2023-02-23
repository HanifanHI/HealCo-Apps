class PredictResultModel {
  PredictResultModel({
    required this.diagnosis,
    required this.email,
    required this.error,
    required this.image,
    required this.probability,
    required this.status,
  });

  final String diagnosis;
  final String email;
  final String error;
  final String image;
  final String probability;
  final int status;

  factory PredictResultModel.fromJson(Map<String, dynamic> json) =>
      PredictResultModel(
        diagnosis: json["diagnosis"],
        email: json["email"],
        error: json["error"],
        image: json["image"],
        probability: json["probability"],
        status: json["status"],
      );
}
