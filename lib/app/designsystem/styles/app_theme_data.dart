import 'package:flutter/material.dart';

import 'app_color_scheme.dart';

class AppThemeData {
  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: AppColorScheme.NEUTRAL_GREY_2_COLOR,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColorScheme.NEUTRAL_GREY_10_COLOR,
    ),
  );
}
