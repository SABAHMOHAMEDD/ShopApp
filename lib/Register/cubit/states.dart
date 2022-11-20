import 'package:shopapp/models/Login_model.dart';

abstract class RegisterStates {}

class RegisterIntialState extends RegisterStates {}

class RegisterLoadinState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final LoginModel loginModel;

  RegisterSuccessState(this.loginModel);
}

class RegisterErrorState extends RegisterStates {
  final String error;

  RegisterErrorState(this.error);
}

class RegChangePasswordVisibilityState extends RegisterStates {}
