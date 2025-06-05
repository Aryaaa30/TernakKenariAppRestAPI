import 'dart:convert';

class Registerrequestmodel {
  final String? username;
  final String? email;
  final String? password;
  final String? passwordConfirmation;
  final int? roleId;

  Registerrequestmodel({
    this.username,
    this.email,
    this.password,
    this.passwordConfirmation,
    this.roleId,
  });

  factory Registerrequestmodel.fromJson(String str) =>
      Registerrequestmodel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Registerrequestmodel.fromMap(Map<String, dynamic> json) =>
      Registerrequestmodel(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
        roleId: json["role_id"],
      );

  Map<String, dynamic> toMap() => {
    "username": username,
    "email": email,
    "password": password,
    "password_confirmation": passwordConfirmation,
    "role_id": roleId,
  };
}
