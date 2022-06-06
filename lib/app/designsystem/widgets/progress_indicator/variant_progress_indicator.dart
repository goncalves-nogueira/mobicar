import 'package:flutter/material.dart';
import 'package:mobicar_app/app/designsystem/styles/app_color_scheme.dart';

enum ProgressindicatorVariant { load, successfull, error }

extension TypeVariant on ProgressindicatorVariant {
  Widget? get typeProgress {
    switch (this) {
      case ProgressindicatorVariant.load:
        return const CircularProgressIndicator(
          strokeWidth: 8,
          color: AppColorScheme.NEUTRAL_GREY_10_COLOR,
        );
      case ProgressindicatorVariant.successfull:
        return const Icon(
          Icons.check,
          color: AppColorScheme.INFO_BLUE_6_COLOR,
          size: 82.0,
        );
      case ProgressindicatorVariant.error:
        return const Icon(
          Icons.close,
          color: AppColorScheme.WARNING_YELLOW_6_COLOR,
          size: 82.0,
        );
    }
  }
}
