class DetailModel {
  final String deskripsi;
  final String error;
  final List<String> gambar;
  final String gejala;
  final String jenis;
  final String nama;
  final String pengendalian;
  final String status;

  DetailModel({
    required this.deskripsi,
    required this.error,
    required this.gambar,
    required this.gejala,
    required this.jenis,
    required this.nama,
    required this.pengendalian,
    required this.status,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        deskripsi: json["deskripsi"],
        error: json["error"],
        gambar: List<String>.from(json["gambar"].map((x) => x)),
        gejala: json["gejala"],
        jenis: json["jenis"],
        nama: json["nama"],
        pengendalian: json["pengendalian"],
        status: json["status"],
      );
}
