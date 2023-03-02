class DeleteHistoryModel {
  DeleteHistoryModel({
    required this.error,
    required this.message,
    required this.status,
  });

  final String error;
  final String message;
  final String status;

  factory DeleteHistoryModel.fromJson(Map<String, dynamic> json) =>
      DeleteHistoryModel(
        error: json["error"],
        message: json["message"],
        status: json["status"],
      );
}
