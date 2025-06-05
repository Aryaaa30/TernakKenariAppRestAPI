import 'dart:convert';

class BurungSemuaTersediaModel {
  final String message;
  final int statusCode;
  final List<DataBurungTersedia> data;

  BurungSemuaTersediaModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  BurungSemuaTersediaModel copyWith({
    String? message,
    int? statusCode,
    List<DataBurungTersedia>? data,
  }) => BurungSemuaTersediaModel(
    message: message ?? this.message,
    statusCode: statusCode ?? this.statusCode,
    data: data ?? this.data,
  );
}
