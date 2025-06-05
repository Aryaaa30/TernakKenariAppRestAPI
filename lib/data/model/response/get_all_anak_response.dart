import 'dart:convert';

class GetAllAnakModel {
  final String message;
  final int statusCode;
  final List<GetAnak> data;

  GetAllAnakModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  GetAllAnakModel copyWith({
    String? message,
    int? statusCode,
    List<GetAnak>? data,
  }) => GetAllAnakModel(
    message: message ?? this.message,
    statusCode: statusCode ?? this.statusCode,
    data: data ?? this.data,
  );
}
