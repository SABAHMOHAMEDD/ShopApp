import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Register/cubit/states.dart';
import 'package:shopapp/models/Login_model.dart';

import '../../shared/network/endPoint.dart';
import '../../shared/network/remote/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit()
      : super(RegisterIntialState()); // need intial state in the super

  static RegisterCubit get(context) => BlocProvider.of(context);

  // so i dont have to intialize the cubit everyTime i use it

  late LoginModel loginModel;
  bool securedPassword = true;
  IconData Suffix = Icons.visibility;

  void ChangePasswordVisibility() {
    securedPassword = !securedPassword;

    Suffix = securedPassword ? Icons.visibility_off : Icons.visibility;
    emit(RegChangePasswordVisibilityState());
  }

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadinState());
    DioHelper.PostData(
      url: REGISTER,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      //  print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      // print(loginModel.message);
      // print(loginModel.status);
      //
      //print(loginModel.data?.email);
      // print(loginModel.data?.token);

      emit(RegisterSuccessState(loginModel));
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  static showLoading(context, String loadingMessage,
      {bool isCancelabele = true}) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 12,
                ),
                Text(loadingMessage),
              ],
            ),
          );
        },
        barrierDismissible: isCancelabele);
  }
}
