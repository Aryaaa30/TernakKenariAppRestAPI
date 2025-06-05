import 'dart:convert';

class Loginrequestmodel {
  final String? email;
  final String? password;

  Loginrequestmodel({this.email, this.password});

  factory Loginrequestmodel.fromJson(String str) =>
      Loginrequestmodel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Loginrequestmodel.fromMap(Map<String, dynamic> json) =>
      Loginrequestmodel(email: json["email"], password: json["password"]);

  Map<String, dynamic> toMap() => {"email": email, "password": password};
}
