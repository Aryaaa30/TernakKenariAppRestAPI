import 'dart:convert';

class BuyerProfileResponseModel {
  String message;
  int statusCode;
  Data data;

  BuyerProfileResponseModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  BuyerProfileResponseModel copyWith({
    String? message,
    int? statusCode,
    Data? data,
  }) => BuyerProfileResponseModel(
    message: message ?? this.message,
    statusCode: statusCode ?? this.statusCode,
    data: data ?? this.data,
  );
}
