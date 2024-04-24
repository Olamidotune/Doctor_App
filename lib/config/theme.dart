import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme();

  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _colorSheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      filledButtonTheme: _filledButtonTheme,
    );
  }

  static ColorScheme get _colorSheme {
    return ColorScheme(
        brightness: Brightness.light,
        primary: Colors.red,
        onPrimary: Colors.teal.shade50,
        secondary: Colors.red.shade400,
        onSecondary: Colors.amber,
        error: Colors.red,
        onError: Colors.redAccent,
        background: Colors.white,
        onBackground: Colors.black,
        surface: Colors.tealAccent,
        onSurface: Colors.black);
  }

  static TextTheme get _textTheme {
    return const TextTheme(titleLarge: TextStyle(fontSize: 30));
  }

  static InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      filled: true,
      fillColor: _colorSheme.background,
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      enabledBorder: _enabledBorder,
      disabledBorder: _disabledBorder,
      focusedBorder: _focusedBorder,
    );
  }

  static FilledButtonThemeData get _filledButtonTheme {
    return FilledButtonThemeData(
        style: FilledButton.styleFrom(
            foregroundColor: Colors.red,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))));
  }

  static InputBorder get _enabledBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(color: Colors.transparent),
      );

  static InputBorder get _disabledBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(color: Colors.grey),
      );

       static InputBorder get _focusedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(color: Colors.green),
      );
}
