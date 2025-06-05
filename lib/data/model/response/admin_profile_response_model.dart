import 'dart:convert';

class AdminProfileResponseModel {
  final String? message;
  final int? statusCode;
  final AdminProfile? data;

  AdminProfileResponseModel({this.message, this.statusCode, this.data});
}
