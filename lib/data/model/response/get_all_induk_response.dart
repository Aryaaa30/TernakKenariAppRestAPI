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
}
