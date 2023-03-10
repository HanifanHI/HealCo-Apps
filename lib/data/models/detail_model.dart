class DetailModel {
  DetailModel({
    required this.deskripsi,
    required this.error,
    required this.gambar,
    required this.gejala,
    required this.nama,
    required this.pengobatan,
    required this.status,
  });

  final String deskripsi;
  final String error;
  final List<String> gambar;
  final String gejala;
  final String nama;
  final String pengobatan;
  final String status;

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        deskripsi: json["deskripsi"],
        error: json["error"],
        gambar: List<String>.from(json["gambar"].map((x) => x)),
        gejala: json["gejala"],
        nama: json["nama"],
        pengobatan: json["pengobatan"],
        status: json["status"],
      );
}
