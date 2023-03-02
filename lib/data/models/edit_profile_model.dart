class EditProfileModel {
  EditProfileModel({
    required this.error,
    required this.message,
    required this.status,
  });

  final String error;
  final String message;
  final int status;

  factory EditProfileModel.fromJson(Map<String, dynamic> json) =>
      EditProfileModel(
        error: json["error"],
        message: json["message"],
        status: json["status"],
      );
}
