class Data {
  String id;
  String email;
  String nama;
  String alamat;
  String avatar;
  String pekerjaan;
  String quote;

  Data({
    required this.id,
    required this.email,
    required this.nama,
    required this.alamat,
    required this.avatar,
    required this.pekerjaan,
    required this.quote,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      email: json['email'],
      nama: json['nama'],
      alamat: json['alamat'],
      avatar: json['avatar'],
      pekerjaan: json['pekerjaan'],
      quote: json['quote'],
    );
  }
}
