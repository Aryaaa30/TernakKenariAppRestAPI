import 'dart:convert';

class Anakrequestmodel {
  final String? name;
  final int? age;
  final String? gender;

  Anakrequestmodel({this.name, this.age, this.gender});

  factory Anakrequestmodel.fromJson(String str) =>
      Anakrequestmodel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Anakrequestmodel.fromMap(Map<String, dynamic> json) =>
      Anakrequestmodel(
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
      );

  Map<String, dynamic> toMap() => {"name": name, "age": age, "gender": gender};
}
