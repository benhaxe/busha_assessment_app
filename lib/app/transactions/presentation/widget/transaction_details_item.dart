import 'package:busha_app/src/extensions/extensions.dart';
import 'package:busha_app/src/scaler/scaler.dart';
import 'package:busha_app/views/widgets/app_divider.dart';

import 'package:flutter/material.dart';

class TransactionDetailsItem extends StatelessWidget {
  const TransactionDetailsItem({
    super.key,
    required this.label,
    required this.value,
    this.isLast = false,
  });

  final String label, value;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: context.textTheme.bodyMedium,
            ),
            const XMargin(60),
            Expanded(
              child: Text(
                value,
                style: context.textTheme.bodyLarge,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        if (!isLast) ...[const AppHorizontalDivider()]
      ],
    );
  }
}
