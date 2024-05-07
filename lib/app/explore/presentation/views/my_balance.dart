import 'package:busha_app/src/extensions/src/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:busha_app/src/extensions/src/context_on_theme_extension.dart';
import 'package:busha_app/src/scaler/scaler.dart';

class MyBalanceView extends StatefulWidget {
  const MyBalanceView({super.key});

  @override
  State<MyBalanceView> createState() => _MyBalanceViewState();
}

class _MyBalanceViewState extends State<MyBalanceView> {
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.insetsSymetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'My balance',
                style: context.textTheme.bodyMedium,
              ),
              const XMargin(4),
              GestureDetector(
                child: const Icon(
                  Icons.visibility,
                  size: 16,
                ),
              ),
            ],
          ),
          const YMargin(8),
          RichText(
            text: TextSpan(
              text: ''.currencySymbol,
              children: <InlineSpan>[
                TextSpan(
                  text: '5,000',
                  style: context.textTheme.headlineMedium,
                ),
                const TextSpan(
                  text: '.00',
                ),
              ],
              style: context.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
