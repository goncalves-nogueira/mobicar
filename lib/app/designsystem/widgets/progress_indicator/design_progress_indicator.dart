import 'package:flutter/material.dart';

import 'variant_progress_indicator.dart';

class DesignProgressIndicator extends StatelessWidget {
  final ProgressindicatorVariant variant;

  const DesignProgressIndicator({
    Key? key,
    required this.variant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: variant.typeProgress,
    );
  }
}
