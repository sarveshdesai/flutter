import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CustomTheme {


  ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Color(0xff0d0d0d),
      primaryColorBrightness: Brightness.dark,
      iconTheme: IconThemeData(
        color: Color(0xfffb6c7e),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(fontFamily: 'Rubik'),
        headline2: TextStyle(fontFamily: 'Rubik'),
        headline3: TextStyle(fontFamily: 'Rubik'),
        headline4: TextStyle(fontFamily: 'Rubik'),
        headline5: TextStyle(color: Colors.white, fontFamily: 'Rubik'),
        headline6: TextStyle(fontFamily: 'Rubik'),
        subtitle1: TextStyle(fontFamily: 'Rubik'),
        subtitle2: TextStyle(fontFamily: 'Rubik'),
        bodyText1: TextStyle(color: Colors.white, fontFamily: 'Rubik'),
        bodyText2: TextStyle(color: Colors.grey[700], fontFamily: 'Rubik'),
        button: TextStyle(color: Colors.white, fontFamily: 'Rubik'),
        caption: TextStyle(fontFamily: 'Rubik'),
        overline: TextStyle(fontFamily: 'Rubik'),

      ),
      buttonColor: Color(0xfffb6c7e),
      accentColor: Color(0xfffb6c7e),
      splashColor: Color(0xfffdabb5),
      cursorColor: Color(0xfffb6c7e),
      primaryColor: Color(0xfffb6c7e),
    );
  }


  ThemeData lightTheme() {
    return ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0xfffedbd0),
        backgroundColor: Color(0xfffedbd0),
        primaryColorBrightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Color(0xff442c2e),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(fontFamily: 'Rubik'),
          headline2: TextStyle(fontFamily: 'Rubik'),
          headline3: TextStyle(fontFamily: 'Rubik'),
          headline4: TextStyle(fontFamily: 'Rubik'),
          headline5: TextStyle(color: Color(0xff442c2e), fontFamily: 'Rubik'),
          headline6: TextStyle(fontFamily: 'Rubik'),
          subtitle1: TextStyle(fontFamily: 'Rubik'),
          subtitle2: TextStyle(fontFamily: 'Rubik'),
          bodyText1: TextStyle(fontFamily: 'Rubik'),
          bodyText2: TextStyle(color: Colors.grey[700], fontFamily: 'Rubik'),
          button: TextStyle(color: Colors.white, fontFamily: 'Rubik'),
          caption: TextStyle(fontFamily: 'Rubik'),
          overline: TextStyle(fontFamily: 'Rubik'),

        ),
        buttonColor: Color(0xff442c2e),
        accentColor: Color(0xff442c2e),
        splashColor: Color(0xff7c6b6c),
        cardColor: Color(0xfffeeae6),
        cursorColor: Color(0xff442c2e),
    );
  }
}