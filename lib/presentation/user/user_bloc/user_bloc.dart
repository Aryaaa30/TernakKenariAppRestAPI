import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ternak_kenari_app/data/model/response/user_model.dart';
import 'package:ternak_kenari_app/data/preferences/user_preferences.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<GetUserFromPreferences>((event, emit) async {
      emit(UserLoading());
      try {
        final user = await UserPreferences.getUser();
        emit(UserLoaded(user: user));
      } catch (e) {
        emit(UserError(message: 'Gagal memuat user: ${e.toString()}'));
      }
    });

    on<RemoveUser>((event, emit) async {
      await UserPreferences.clearUser();
      emit(UserInitial());
    });
  }
}
