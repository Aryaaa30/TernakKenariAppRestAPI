import 'dart:convert';

class Indukrequestmodel {
  final String? name;
  final int? age;
  final String? gender;

  Indukrequestmodel({this.name, this.age, this.gender});

  factory Indukrequestmodel.fromJson(String str) =>
      Indukrequestmodel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Indukrequestmodel.fromMap(Map<String, dynamic> json) =>
      Indukrequestmodel(
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
      );

  Map<String, dynamic> toMap() => {"name": name, "age": age, "gender": gender};
}
