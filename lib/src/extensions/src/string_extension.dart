import 'dart:io';

import 'package:intl/intl.dart';

extension StringExtension on String {
  String get formatedDate {
    final date = DateTime.tryParse(this) ?? DateTime.now();
    return DateFormat("MMM dd,yyyy").format(date);
  }

  String get time {
    final date = DateTime.tryParse(this) ?? DateTime.now();
    return DateFormat.Hms().format(date);
  }

  String get timeDayAgo {
    final now = DateTime.now();
    final anHourAgo =
        now.subtract(const Duration(minutes: Duration.minutesPerHour));

    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final dateToCheck = DateTime.tryParse(this) ?? DateTime.now();

    final aDate = DateTime(
      dateToCheck.year,
      dateToCheck.month,
      dateToCheck.day,
    );

    if (aDate == anHourAgo) {
      return '1h';
    } else if (aDate == today) {
      return '23 h';
    } else if (aDate == yesterday) {
      return '1 Day';
    } else {
      return '';
    }
  }

  String get currencySymbol {
    final formatCurrency = NumberFormat.simpleCurrency(
      locale: Platform.localeName,
      name: 'NGN',
    );
    return formatCurrency.currencySymbol;
  }
}
