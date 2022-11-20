import 'package:flutter/material.dart';

import '../../login/login_screen.dart';
import '../network/local/cache_helper.dart';

void SignOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      Navigator.pushReplacementNamed(context, LoginScreen.RouteName);
    }
  });
}

//String token='';
final String? token = CacheHelper.getData(key: 'token');
