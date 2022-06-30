import 'package:akary/data/models/auth/login_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}

class ChangePasswordVisibilityState extends LoginState {}
