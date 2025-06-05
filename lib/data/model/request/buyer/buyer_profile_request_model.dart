import 'dart:convert';

class Buyerprofilerequestmodel {
  final String? name;
  final String? address;
  final String? phoneNumber;

  Buyerprofilerequestmodel({this.name, this.address, this.phoneNumber});

  factory Buyerprofilerequestmodel.fromJson(String str) =>
      Buyerprofilerequestmodel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Buyerprofilerequestmodel.fromMap(Map<String, dynamic> json) =>
      Buyerprofilerequestmodel(
        name: json["name"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toMap() => {
    "name": name,
    "address": address,
    "phoneNumber": phoneNumber,
  };
}
