import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'events/login_events.dart';
import 'states/login_state.dart';
import '../repositories/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  final SharedPreferences shared;

  LoginBloc(this.loginRepository, this.shared) : super(LoginIdle()) {
    on<LoginWithEmail>(loginEmail);
  }

  Future loginEmail(LoginWithEmail event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      var resposta = await loginRepository.login(event.email, event.password);

      emit(LoginSuccess());

      shared.setBool('isLogged', true);
      shared.setString('jwt_token', resposta['jwt_token']);
    } catch (erro) {
      emit(LoginFailure(erro.toString()));
    }
  }
}
