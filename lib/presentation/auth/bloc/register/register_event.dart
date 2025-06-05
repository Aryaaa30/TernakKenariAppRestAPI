part of 'register_bloc.dart';

sealed class RegisterEvent {}

class RegisterRequested extends RegisterEvent {
  final Registerrequestmodel requestModel;

  RegisterRequested({required this.requestModel});
}
