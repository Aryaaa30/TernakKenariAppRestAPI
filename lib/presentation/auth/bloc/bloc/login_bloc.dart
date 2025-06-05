import 'package:bloc/bloc.dart';
import 'package:ternak_kenari_app/data/model/request/auth/login_request_model.dart';
import 'package:ternak_kenari_app/data/model/response/auth_response_model.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc(this.authRepository) : super(LoginInitial()) {
    on<required this._authRepository}>{_onLoginRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
   Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    final result = await authRepository.login(event.requestModel);

    result.fold(
      (l) => emit(LoginFailure(error: l)),
      (r) => emit(LoginSuccess(responseModel: r)),
    );
  }
}
