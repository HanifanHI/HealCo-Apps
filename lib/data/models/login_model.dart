class LoginModel {
  LoginModel({
    required this.email,
    required this.message,
    required this.status,
    required this.token,
  });

  String email;
  String message;
  String status;
  String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        email: json["email"],
        message: json["message"],
        status: json["status"],
        token: json["token"],
      );
}
