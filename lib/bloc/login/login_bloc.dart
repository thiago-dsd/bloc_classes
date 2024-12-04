import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<PasswordChanged>(_loginApi);
  }

  void _emailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      email: event.email,
    ));
  }

  void _passwordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      email: event.password,
    ));
  }

  void _loginApi(PasswordChanged event, Emitter<LoginState> emit) {
    // emit(state.copyWith(
    //   email: event.password,
    // ));
  }
}
