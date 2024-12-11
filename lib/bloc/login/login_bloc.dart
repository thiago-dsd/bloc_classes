import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

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

  void _loginApi(PasswordChanged event, Emitter<LoginState> emit) async {
    Map data = {"email": state.email, "password": state.password};

    try {
      final response =
          await http.post(Uri.parse("https://reqres.in/api/login"), body: data);
    } catch (e) {
      emit(state.copyWith(
          loginStatus: LoginStatus.error,
          message: "Request error, ${e.toString()}"));
    }
  }
}
