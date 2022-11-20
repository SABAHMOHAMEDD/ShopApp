import 'package:shopapp/models/Login_model.dart';

abstract class LoginStates {}

class LoginIntialState extends LoginStates {}

class LoginLoadinState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}

class ChangePasswordVisibilityState extends LoginStates {}
