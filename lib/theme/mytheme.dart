import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTheme {
  static final Color primaryColor = Colors.black;

  // static final Color ColorYellow = Color(0xFFFACC1D);
  // static final ColorDarkBlue  = Color(0xFF141A2E);

  static final ThemeData LightTheme = ThemeData(
      fontFamily: 'j',
      //  backgroundColor: Colors.white,
      primaryColor: Colors.black,
      // cardColor: Colors.black,
      //   scaffoldBackgroundColor: Colors.transparent,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
      appBarTheme: AppBarTheme(
          backwardsCompatibility: true,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark),
          iconTheme: IconThemeData(color: Colors.black, size: 32),
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold)),

      // textTheme:  TextTheme(
      //   bodyText2: TextStyle(
      //     //hadeth &quran names
      //     color: Colors.black,
      //     fontSize: 25,
      //     //   fontWeight: FontWeight.w500,
      //   ),
      //   bodyText1: TextStyle(
      //     color: Colors.black,
      //     fontSize: 25,
      //     //   fontWeight: FontWeight.w500,
      //   ),
      //   headline4: TextStyle(
      //     fontSize: 20,
      //     color: Colors.black,
      //   ),
      //   headline3: TextStyle(
      //     fontSize: 22,
      //     color: Colors.black,
      //   ),
      //   headline5: TextStyle(fontSize: 25, color: Colors.black),
      //   headline6: TextStyle(
      //
      //       fontSize: 25,
      //       color: Colors.black),
      //   headline1: TextStyle(
      //
      //       fontSize: 25,
      //       color: Colors.white),
      // ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedIconTheme: IconThemeData(color: Colors.black),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          selectedLabelStyle: TextStyle(color: Colors.black),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          selectedItemColor: Colors.black //El line daaaaaa

          ));

  static final ThemeData DarkTheme = ThemeData(
      fontFamily: 'j',

      // backgroundColor: ColorDarkBlue,
      // cardColor: ColorYellow,
      // primaryColor: ColorYellow,

      //bottomSheetTheme: BottomSheetThemeData(backgroundColor: ColorDarkBlue),

      appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark),
          iconTheme: IconThemeData(color: Colors.black, size: 32),
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold)));

// textTheme: TextTheme(
//   bodyText2: TextStyle(
//     color: Colors.white,
//     fontSize: 25,
//     //   fontWeight: FontWeight.w500,
//   ),
//   bodyText1: TextStyle(
//     color: Colors.white,
//     fontSize: 25,
//     //   fontWeight: FontWeight.w500,
//   ),
//   headline2: TextStyle(
//     // for hadeth header
//     fontSize: 25,
//     color: ColorYellow,
//     //   fontWeight: FontWeight.w500,
//   ),
//   headline4: TextStyle(
//     fontSize: 20,
//     color: ColorYellow,
//     //   fontWeight: FontWeight.w500,
//   ),
//   headline3: TextStyle(
//     // for settings page
//     fontSize: 22,
//     color: Colors.white,
//     //   fontWeight: FontWeight.w500,
//   ),
//   headline5: TextStyle(
//       //for quran& hadeth content
//
//       fontSize: 25,
//       color: ColorYellow),
//   headline6: TextStyle(
//       //for sebha page
//
//       fontSize: 25,
//       color: Colors.white),
//   headline1: TextStyle(
//       //for sebha page/ el tasbeh
//
//       fontSize: 25,
//       color: Colors.black),
// ),

// bottomNavigationBarTheme:  BottomNavigationBarThemeData(
//   backgroundColor: ColorDarkBlue,
//     selectedIconTheme: IconThemeData(color: ColorYellow),
//     unselectedIconTheme: IconThemeData(color: Colors.white),
//     selectedLabelStyle: TextStyle(color: ColorYellow),
//     unselectedLabelStyle: TextStyle(color: Colors.black),
//     selectedItemColor: ColorYellow,
//
//
// ));

}
