import 'package:busha_app/app/explore/domain/entities/my_asset.dart';
import 'package:busha_app/src/extensions/extensions.dart';
import 'package:busha_app/src/scaler/scaler.dart';
import 'package:busha_app/src/values/colors/colors.dart';
import 'package:flutter/material.dart';

class MyAssetItem extends StatelessWidget {
  const MyAssetItem({
    super.key,
    this.asset,
  });

  final Asset? asset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.insetsSymetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(asset!.coinLogoFallBack),
              const XMargin(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(asset?.coin ?? 'Bitcoin'),
                  Text(asset?.abbreviation ?? 'BTC'),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${asset?.walletBalance?.naira}'),
              Row(
                children: [
                  Icon(
                    asset!.isGaining
                        ? Icons.arrow_outward
                        : Icons.arrow_downward_sharp,
                    size: 16,
                    color: asset!.isGaining
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
          )
        ],
      ),
    );
  }
}
