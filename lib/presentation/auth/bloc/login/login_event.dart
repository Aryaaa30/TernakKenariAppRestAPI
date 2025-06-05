import 'package:ternak_kenari_app/data/model/request/auth/login_request_model.dart';

sealed class LoginEvent {}

class LoginRequested extends LoginEvent {
  final Loginrequestmodel requestModel;

  LoginRequested({required this.requestModel});
}
