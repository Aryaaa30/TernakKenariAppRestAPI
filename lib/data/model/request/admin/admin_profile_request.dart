import 'dart:convert';

class Adminprofilerequest {
  final String? name;

  Adminprofilerequest({this.name});

  factory Adminprofilerequest.fromJson(String str) =>
      Adminprofilerequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Adminprofilerequest.fromMap(Map<String, dynamic> json) =>
      Adminprofilerequest(name: json["name"]);

  Map<String, dynamic> toMap() => {"name": name};
}
