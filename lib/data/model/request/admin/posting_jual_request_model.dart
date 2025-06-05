import 'dart:convert';

class Postingjualrequestmodel {
  final int? burungId;
  final String? burungType;
  final int? harga;
  final String? deskripsi;

  Postingjualrequestmodel({
    this.burungId,
    this.burungType,
    this.harga,
    this.deskripsi,
  });

  factory Postingjualrequestmodel.fromJson(String str) =>
      Postingjualrequestmodel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Postingjualrequestmodel.fromMap(Map<String, dynamic> json) =>
      Postingjualrequestmodel(
        burungId: json["burung_id"],
        burungType: json["burung_type"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
      );

  Map<String, dynamic> toMap() => {
    "burung_id": burungId,
    "burung_type": burungType,
    "harga": harga,
    "deskripsi": deskripsi,
  };
}
