class UserModel {
  UserModel({
    required this.email,
    required this.error,
    required this.id,
    required this.name,
    required this.noHp,
    required this.profile,
  });

  final String email;
  final String error;
  final int id;
  final String name;
  final String noHp;
  final String profile;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        error: json["error"],
        id: json["id"],
        name: json["name"],
        noHp: json["no_hp"],
        profile: json["profile"],
      );
}
