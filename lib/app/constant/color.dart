import 'package:flutter/material.dart';

const appPurple = Color(0xFF431AA1);
const appPurpleDark = Color(0xFF1E0771);
const appPurpleLight1 = Color(0xFF9345F2);
const appPurpleLight2 = Color(0xFFB9A2D8);
const appWhite = Color(0xFFFAF8FC);
const appOrange = Color(0xFFE6704A);

ThemeData themeLight = ThemeData(
    brightness: Brightness.light,
    // primaryColor: appPurple,
    scaffoldBackgroundColor: appWhite,
    appBarTheme: AppBarTheme(elevation: 0),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: appPurple, foregroundColor: appWhite)),
    useMaterial3: true,
    textTheme: TextTheme(
        // bodySmall: TextStyle(color: appPurpleDark),
        // bodyMedium: TextStyle(color: appPurpleDark),
        labelLarge: TextStyle(color: appPurple)),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: appPurple, foregroundColor: appWhite),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent)
    // listTileTheme: ListTileThemeData(textColor: appPurple)
    );

ThemeData themeDark = ThemeData(
    brightness: Brightness.dark,
    // primaryColor: appPurple,
    scaffoldBackgroundColor: appPurpleDark,
    appBarTheme: AppBarTheme(elevation: 0, backgroundColor: appPurpleDark),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: appWhite, foregroundColor: appPurple)),
    useMaterial3: true,
    textTheme: TextTheme(
        bodySmall: TextStyle(color: appWhite),
        bodyMedium: TextStyle(color: appWhite),
        labelLarge: TextStyle(color: appWhite)),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: appOrange, foregroundColor: appWhite),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent)
    // listTileTheme: ListTileThemeData(textColor: appWhite)
    );
