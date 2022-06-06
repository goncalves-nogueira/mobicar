import 'package:flutter/material.dart';

import 'variant_button.dart';

class MobicarButton extends StatelessWidget {
  final String text;
  final ButtonVariant variant;
  final Function() onPressed;

  const MobicarButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.variant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Text(
          text,
          style: variant.styleText,
        ),
      ),
      style: variant.styleButton,
    );
  }
}
