import 'package:flutter/material.dart';

class AppThemeManager {
  static const Color primaryColor = Color(0xff5D9CEC);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFDFECDB),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: const BorderSide(color: Colors.white, width: 4)),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      elevation: 0,
      showSelectedLabels: false,
      selectedIconTheme: IconThemeData(color: primaryColor, size: 35),
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        color: Color(0xffC8C9CB),
        size: 30,
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.white,
      padding: EdgeInsets.zero
    )
  );
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xFF060E1E),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: Color(0xFF141922), width: 4)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        selectedIconTheme: IconThemeData(color: primaryColor, size: 35),
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(
          color: Color(0xffC8C9CB),
          size: 30,
        ),
        selectedItemColor: primaryColor,
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
          color: Color(0xFF141922),
          padding: EdgeInsets.zero
      )
  );

}
