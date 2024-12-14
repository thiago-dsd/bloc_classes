import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<LoginApi>(_loginApi);
  }

  void _emailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      email: event.email,
    ));
  }

  void _passwordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      password: event.password,
    ));
  }

  void _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));

    Map data = {"email": state.email, "password": state.password};

    try {
      final response =
          await http.post(Uri.parse("https://reqres.in/api/login"), body: data);
      var dataDetails = jsonDecode(response.body);

      // if (response.statusCode == 201) {
      emit(state.copyWith(
          loginStatus: LoginStatus.sucess, message: "Login successful."));
      // }
      // else {
      //   emit(state.copyWith(
      //       loginStatus: LoginStatus.error, message: dataDetails["error"]));
      // }
    } catch (e) {
      emit(state.copyWith(
          loginStatus: LoginStatus.error,
          message: "Request error, ${e.toString()}"));
    }
  }
}
