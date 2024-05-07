import 'dart:io';

import 'package:intl/intl.dart';

extension NumExtension on num {
  String get formatIndication {
    try {
      final value = this / 100;
      return '$value%';
    } catch (_) {
      return '0%';
    }
  }

  String get naira {
    final formatCurrency = NumberFormat.simpleCurrency(
      locale: Platform.localeName,
      name: 'NGN',
      decimalDigits: 0,
    );
    try {
      return formatCurrency.format(this);
    } catch (_) {
      return "${formatCurrency.currencySymbol}0";
    }
  }
}
