class DetailModel {
  DetailModel({
    required this.deskripsi,
    required this.error,
    required this.gambar,
    required this.gejala,
    required this.nama,
    required this.pengobatan,
  });

  final String deskripsi;
  final String error;
  final List<String> gambar;
  final String gejala;
  final String nama;
  final String pengobatan;

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        deskripsi: json["deskripsi"],
        error: json["error"],
        gambar: List<String>.from(json["gambar"].map((x) => x)),
        gejala: json["gejala"],
        nama: json["nama"],
        pengobatan: json["pengobatan"],
      );
}
