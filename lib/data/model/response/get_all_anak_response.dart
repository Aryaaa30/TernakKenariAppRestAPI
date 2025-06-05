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

  factory GetAllAnakModel.fromRawJson(String str) =>
      GetAllAnakModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetAllAnakModel.fromJson(Map<String, dynamic> json) =>
      GetAllAnakModel(
        message: json["message"],
        statusCode: json["status_code"],
        data: List<GetAnak>.from(json["data"].map((x) => GetAnak.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status_code": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
