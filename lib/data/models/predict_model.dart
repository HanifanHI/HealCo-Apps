class PredictModel {
  PredictModel({
    required this.diagnosis,
    required this.email,
    required this.error,
    required this.image,
    required this.message,
    required this.probability,
    required this.status,
  });

  final String diagnosis;
  final String email;
  final String error;
  final String image;
  final String message;
  final String probability;
  final String status;

  factory PredictModel.fromJson(Map<String, dynamic> json) => PredictModel(
        diagnosis: json["diagnosis"],
        email: json["email"],
        error: json["error"],
        image: json["image"],
        message: json["message"],
        probability: json["probability"],
        status: json["status"],
      );
}
