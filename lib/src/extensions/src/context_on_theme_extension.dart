import 'package:flutter/material.dart';
import 'package:busha_app/src/theme/text_theme.dart';

extension ATextTheme on BuildContext {
  AppTextTheme get textTheme {
    return Theme.of(this).extension<AppTextTheme>()!;
  }
}
