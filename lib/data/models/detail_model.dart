import 'dart:convert';

DetailModel detailModelFromJson(String str) =>
    DetailModel.fromJson(json.decode(str));

String detailModelToJson(DetailModel data) => json.encode(data.toJson());

class DetailModel {
  DetailModel({
    required this.deskripsi,
    required this.gambar,
    required this.gejala,
    required this.nama,
    required this.pengobatan,
  });

  final String deskripsi;
  final List<String> gambar;
  final String gejala;
  final String nama;
  final String pengobatan;

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        deskripsi: json["deskripsi"],
        gambar: List<String>.from(json["gambar"].map((x) => x)),
        gejala: json["gejala"],
        nama: json["nama"],
        pengobatan: json["pengobatan"],
      );

  Map<String, dynamic> toJson() => {
        "deskripsi": deskripsi,
        "gambar": List<dynamic>.from(gambar.map((x) => x)),
        "gejala": gejala,
        "nama": nama,
        "pengobatan": pengobatan,
      };
}
