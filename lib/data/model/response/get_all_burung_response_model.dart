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

  factory GetAllBurungModel.fromJson(String str) =>
      GetAllBurungModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAllBurungModel.fromMap(Map<String, dynamic> json) =>
      GetAllBurungModel(
        message: json["message"],
        statusCode: json["status_code"],
        data: List<GetAllBurung>.from(
          json["data"].map((x) => GetAllBurung.fromMap(x)),
        ),
      );

  Map<String, dynamic> toMap() => {
    "message": message,
    "status_code": statusCode,
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };
}
