import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:san3a/shared/styles/colors.dart';

class AppThemes {
  static ThemeData light = ThemeData(
      primarySwatch: defaultColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          titleSpacing: 20.0,
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.blue,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark)),
      textTheme: const TextTheme(
          bodyText1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      )),
      fontFamily: 'Raleway');

  static ThemeData dark = ThemeData(
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.blue),
    scaffoldBackgroundColor: const Color(0xff17191a),
    appBarTheme: AppBarTheme(
        titleSpacing: 20.0,
        backgroundColor: const Color(0xff17191a),
        elevation: 0.0,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('333739'),
            statusBarIconBrightness: Brightness.light)),
    bottomAppBarTheme: const BottomAppBarTheme(
        color: Color(0xff17191a),

    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    textTheme:  const TextTheme(
        bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
        caption: TextStyle(
        fontSize: 10.0,
        fontWeight: FontWeight.w600,
        color:  Color(0xFF7E8181),
      ),

    ),

    cardTheme: const CardTheme(
      color:  Color(0xff242627),
      elevation: 0,
      shadowColor: Colors.transparent
    ),

  );
}
