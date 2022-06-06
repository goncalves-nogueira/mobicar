import 'package:flutter/material.dart';
import 'package:mobicar_app/app/designsystem/styles/app_color_scheme.dart';
import 'package:mobicar_app/app/designsystem/styles/app_text_theme.dart';

enum ButtonVariant {
  primary,
  second,
}

extension TypeButtonVariant on ButtonVariant {
  ButtonStyle? get styleButton {
    switch (this) {
      case ButtonVariant.primary:
        return TextButton.styleFrom(
          backgroundColor: AppColorScheme.NEUTRAL_GREY_10_COLOR,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        );
      case ButtonVariant.second:
        return TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(
                  width: 1.0, color: AppColorScheme.NEUTRAL_GREY_10_COLOR)),
        );
    }
  }

  TextStyle? get styleText {
    switch (this) {
      case ButtonVariant.primary:
        return const Helvetica400Font(
          color: AppColorScheme.NEUTRAL_GREY_1_COLOR,
          fontSize: 12.0,
        );
      case ButtonVariant.second:
        return const Helvetica400Font(
          color: AppColorScheme.NEUTRAL_GREY_10_COLOR,
          fontSize: 12.0,
        );
    }
  }
}
