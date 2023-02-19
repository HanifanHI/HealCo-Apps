class RegisterModel {
  RegisterModel({
    required this.message,
    required this.status,
  });

  String message;
  int status;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        message: json["message"],
        status: json["status"],
      );
}
