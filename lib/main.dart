import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Register/Register_screen.dart';
import 'package:shopapp/layout/cubit/cubit.dart';
import 'package:shopapp/login/login_screen.dart';
import 'package:shopapp/modules/Search/search_screen.dart';
import 'package:shopapp/on_board/on_board_screen.dart';
import 'package:shopapp/shared/bloc_observer.dart';
import 'package:shopapp/shared/network/local/cache_helper.dart';
import 'package:shopapp/shared/network/remote/dio_helper.dart';
import 'package:shopapp/theme/mytheme.dart';

import 'layout/Home/Home_screen.dart';
import 'login/cubit/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  final bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  final String? token = CacheHelper.getData(key: 'token');

  print(onBoarding);
  print(token);

  Widget widget;

  if (onBoarding != null) {
    if (token != null)
      widget = HomeScreen();
    else
      widget = LoginScreen();
  } else {
    widget = OnBoardScreen();
  }

  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp(this.startWidget);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => LoginCubit()
              //..userLogin(email: LoginScreen.emailController.text, password: LoginScreen.passwordController.text),
              ),
          BlocProvider(
            create: (BuildContext context) => ShopCubit()
              ..getHomeData()
              ..getCategories()
              ..getFavorites()
              ..getUserData(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyTheme.LightTheme,
          darkTheme: MyTheme.DarkTheme,
          routes: {
            OnBoardScreen.RouteName: (_) => OnBoardScreen(),
            LoginScreen.RouteName: (_) => LoginScreen(),
            RegisterScreen.RouteName: (_) => RegisterScreen(),
            HomeScreen.RouteName: (_) => HomeScreen(),
            SearchScreen.RouteName: (_) => SearchScreen()
          },
          home: LoginScreen(),
          //  initialRoute: LoginScreen.RouteName,
        ));
  }
}
