class SearchModel {
  final List<Data> data;
  final String error;
  final String status;

  SearchModel({required this.data, required this.error, required this.status});

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        error: json["error"],
        status: json["status"],
      );
}

class Data {
  final String deskripsi;
  final List<String> gambar;
  final String gejala;
  final String jenis;
  final String nama;
  final String pengendalian;

  Data({
    required this.deskripsi,
    required this.gambar,
    required this.gejala,
    required this.jenis,
    required this.nama,
    required this.pengendalian,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        deskripsi: json["deskripsi"],
        gambar: List<String>.from(json["gambar"].map((x) => x)),
        gejala: json["gejala"],
        jenis: json["jenis"],
        nama: json["nama"],
        pengendalian: json["pengendalian"],
      );
}
