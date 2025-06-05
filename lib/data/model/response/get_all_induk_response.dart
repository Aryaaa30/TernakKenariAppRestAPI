import 'dart:convert';

class GetIndukById {
  final String message;
  final int statusCode;
  final GetInduk data;

  GetIndukById({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  GetIndukById copyWith({String? message, int? statusCode, GetInduk? data}) =>
      GetIndukById(
        message: message ?? this.message,
        statusCode: statusCode ?? this.statusCode,
        data: data ?? this.data,
      );

  factory GetIndukById.fromRawJson(String str) =>
      GetIndukById.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetIndukById.fromJson(Map<String, dynamic> json) => GetIndukById(
    message: json["message"],
    statusCode: json["status_code"],
    data: GetInduk.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status_code": statusCode,
    "data": data.toJson(),
  };
}
