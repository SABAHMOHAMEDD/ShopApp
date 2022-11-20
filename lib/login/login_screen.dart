import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Register/Register_screen.dart';
import 'package:shopapp/layout/Home/Home_screen.dart';
import 'package:shopapp/login/cubit/cubit.dart';
import 'package:shopapp/login/cubit/states.dart';
import 'package:shopapp/shared/components/components.dart';
import 'package:shopapp/shared/network/local/cache_helper.dart';

class LoginScreen extends StatelessWidget {
  static const String RouteName = 'login';

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool securedPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child:
            BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status == true) {
              print(state.loginModel.message.toString());

              showToast(
                  text: state.loginModel.message ?? "",
                  state: ToastState.SUCCESS);

              print(state.loginModel.data?.token);
              CacheHelper.saveData(
                      key: 'token', value: state.loginModel.data?.token)
                  .then((value) {
                Navigator.pushReplacementNamed(context, HomeScreen.RouteName);
              });
            } else {
              showToast(
                  text: state.loginModel.message ?? "",
                  state: ToastState.ERROR);
            }
          }
        }, builder: (context, state) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: Colors.black),
                        ),
                        Text('Login now to browse our flash sale',
                            style: Theme.of(context).textTheme.headline6),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            onChange: () {},
                            validator: (String? text) {
                              if (text!.isEmpty) {
                                return 'please enter Your Email';
                              }
                              return null;
                            },
                            label: 'Email',
                            prefix: Icons.email),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            onChange: () {},
                            validator: (String? text) {
                              if (text!.isEmpty) {
                                return 'please enter Your password';
                              }
                              return null;
                            },
                            label: 'Password',
                            prefix: Icons.lock),
                        SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                            condition: state is! LoginLoadinState,
                            builder: (context) => defaultButton(
                                function: () {
                                  if (formKey.currentState?.validate() ==
                                      true) {
                                    LoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                    // Navigator.pushReplacementNamed(context, HomeScreen.RouteName);

                                  }
                                },
                                text: 'Login',
                                background: Colors.black),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator())),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'You Don\'t have an Account?',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(fontSize: 17),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RegisterScreen.RouteName);
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(fontSize: 17),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
