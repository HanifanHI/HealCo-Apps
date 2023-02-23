class TanggapanModel {
  TanggapanModel({
    required this.error,
    required this.message,
  });

  final String error;
  final String message;

  factory TanggapanModel.fromJson(Map<String, dynamic> json) => TanggapanModel(
        error: json["error"],
        message: json["message"],
      );
}
