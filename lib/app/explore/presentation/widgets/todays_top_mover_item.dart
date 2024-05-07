import 'package:busha_app/app/explore/domain/entities/my_asset.dart';
import 'package:busha_app/app/transactions/presentation/screens/tranaction_screen.dart';
import 'package:busha_app/src/extensions/extensions.dart';
import 'package:busha_app/src/scaler/scaler.dart';
import 'package:busha_app/src/values/colors/colors.dart';

import 'package:flutter/material.dart';

class TodaysTopMoverItem extends StatelessWidget {
  const TodaysTopMoverItem({
    super.key,
    this.asset,
  });

  final Asset? asset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.insetsOnly(right: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) {
                return const TransactionScreen();
              },
            ),
          );
        },
        child: Container(
          padding: context.insetsAll(16).copyWith(right: 48),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.subHeading,
              width: .3,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(asset!.coinLogoFallBack),
              const YMargin(8),
              Text(asset?.coin ?? 'Bitcoin'),
              const YMargin(8),
              Row(
                children: [
                  Icon(
                    asset?.isGaining ?? false
                        ? Icons.arrow_outward
                        : Icons.arrow_downward_sharp,
                    size: 16,
                    color: asset?.isGaining ?? false
                        ? AppColors.primaryGreen
                        : AppColors.primaryRed,
                  ),
                  Text(
                    '${asset?.indication?.formatIndication}',
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
