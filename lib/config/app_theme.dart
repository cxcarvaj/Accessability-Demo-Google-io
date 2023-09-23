import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      );
}
