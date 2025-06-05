import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ternak_kenari_app/data/model/request/auth/login_request_model.dart';
import 'package:ternak_kenari_app/data/model/request/auth/register_request_model.dart';
import 'package:ternak_kenari_app/data/model/response/auth_response_model.dart';
import 'package:ternak_kenari_app/service/service_http_client.dart';

class AuthRepository {
  final ServiceHttpClient _client;

  AuthRepository(this._client);

  Future<Either<String, AuthResponseModel>> login(
    Loginrequestmodel request,
  ) async {
    try {
      final response = await _client.post('login', request.toMap());

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final model = AuthResponseModel.fromJson(jsonResponse);
        return Right(model);
      } else {
        final jsonResponse = json.decode(response.body);
        return Left(jsonResponse['message'] ?? 'Unknown error occurred');
      }
    } catch (e) {
      return Left('Login failed: $e');
    }
  }

  Future<Either<String, String>> register(Registerrequestmodel request) async {
    try {
      final response = await _client.post('register', request.toMap());

      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        return Right(jsonResponse['message'] ?? "Registrasi berhasil");
      } else {
        final jsonResponse = json.decode(response.body);
        return Left(jsonResponse['message'] ?? "Registrasi gagal");
      }
    } catch (e) {
      return Left('Register failed: $e');
    }
  }
}
