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

  factory BuyerProfileResponseModel.fromRawJson(String str) =>
      BuyerProfileResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BuyerProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      BuyerProfileResponseModel(
        message: json["message"],
        statusCode: json["status_code"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status_code": statusCode,
    "data": data.toJson(),
  };
}
