import 'package:busha_app/src/scaler/scaler.dart';
import 'package:busha_app/src/values/colors/colors.dart';
import 'package:flutter/material.dart';

class AppHorizontalDivider extends StatelessWidget {
  const AppHorizontalDivider({
    super.key,
    this.topMargin,
    this.bottomMargin,
  });

  final double? topMargin;
  final double? bottomMargin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        YMargin(topMargin ?? 20),
        const Divider(
          color: AppColors.subHeading,
          thickness: 0.2,
          height: 1,
        ),
        YMargin(topMargin ?? 20),
      ],
    );
  }
}
