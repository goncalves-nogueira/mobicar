import 'package:flutter/material.dart';
import 'package:mobicar_app/app/designsystem/styles/app_color_scheme.dart';
import 'package:mobicar_app/app/designsystem/styles/app_text_theme.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColorScheme.NEUTRAL_GREY_10_COLOR,
      width: double.infinity,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.copyright_rounded,
            color: AppColorScheme.INFO_BLUE_6_COLOR,
          ),
          SizedBox(width: 14),
          Text(
            "2020. All rights reserved to Mobcar.",
            style: Helvetica400Font(color: AppColorScheme.INFO_BLUE_6_COLOR),
          ),
        ],
      ),
    );
  }
}
