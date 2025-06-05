import 'dart:convert';

class GetAllBurungModel {
  final String message;
  final int statusCode;
  final List<GetAllBurung> data;

  GetAllBurungModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  GetAllBurungModel copyWith({
    String? message,
    int? statusCode,
    List<GetAllBurung>? data,
  }) => GetAllBurungModel(
    message: message ?? this.message,
    statusCode: statusCode ?? this.statusCode,
    data: data ?? this.data,
  );
}
