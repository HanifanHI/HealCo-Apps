class RegisterModel {
  RegisterModel({
    required this.error,
    required this.message,
    required this.status,
  });

  final String error;
  final String message;
  final String status;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        error: json["error"],
        message: json["message"],
        status: json["status"],
      );
}
