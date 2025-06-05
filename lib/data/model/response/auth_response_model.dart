import 'dart:convert';

class AuthResponseModel {
  final String? message;
  final int? statusCode;
  final User? user;

  AuthResponseModel({this.message, this.statusCode, this.user});
}
