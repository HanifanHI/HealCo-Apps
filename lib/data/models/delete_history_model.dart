class DeleteHistoryModel {
  DeleteHistoryModel({
    required this.error,
    required this.message,
  });

  final String error;
  final String message;

  factory DeleteHistoryModel.fromJson(Map<String, dynamic> json) =>
      DeleteHistoryModel(
        error: json["error"],
        message: json["message"],
      );
}
