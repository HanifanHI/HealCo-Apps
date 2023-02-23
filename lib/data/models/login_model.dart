class LoginModel {
  LoginModel({
    required this.email,
    required this.error,
    required this.message,
    required this.status,
    required this.token,
  });

  final String email;
  final String error;
  final String message;
  final String status;
  final String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        email: json["email"],
        error: json["error"],
        message: json["message"],
        status: json["status"],
        token: json["token"],
      );
}
