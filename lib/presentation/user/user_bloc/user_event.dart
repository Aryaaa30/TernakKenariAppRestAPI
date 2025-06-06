part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class GetUserFromPreferences extends UserEvent {
  const GetUserFromPreferences();
}

class RemoveUser extends UserEvent {
  const RemoveUser();
}
