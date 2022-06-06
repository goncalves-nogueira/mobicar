import 'package:flutter/cupertino.dart';

import 'app_color_scheme.dart';

class Helvetica400Font extends TextStyle {
  const Helvetica400Font({
    double fontSize = 14,
    Color color = AppColorScheme.NEUTRAL_GREY_10_COLOR,
  }) : super(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
          fontFamily: "Helvetica",
        );
}

class Helvetica700Font extends TextStyle {
  const Helvetica700Font({
    double fontSize = 14,
    Color color = AppColorScheme.NEUTRAL_GREY_10_COLOR,
  }) : super(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          fontFamily: "Helvetica",
        );
}

class Helvetica300Font extends TextStyle {
  const Helvetica300Font({
    double fontSize = 14,
    Color color = AppColorScheme.NEUTRAL_GREY_10_COLOR,
  }) : super(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
          fontFamily: "Helvetica",
        );
}
