import 'package:busha_app/app/transactions/domain/entities/transaction.dart';
import 'package:busha_app/app/transactions/presentation/screens/transaction_details_screen.dart';
import 'package:busha_app/src/extensions/extensions.dart';
import 'package:busha_app/src/scaler/scaler.dart';
import 'package:busha_app/src/values/assets/svg.dart';
import 'package:busha_app/src/values/colors/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    this.transaction,
  });

  final Transaction? transaction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return TransactionDetailsScreen(
                transaction: transaction!,
              );
            },
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  transaction?.hash ?? 'Hash',
                  style: context.textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const XMargin(16),
              Transform.flip(
                flipX: true,
                child: SvgPicture.asset(
                  kSVGAppBarBackButton,
                  color: AppColors.subHeading,
                  height: 24,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                '${transaction?.dateTime ?? ''}',
                style: context.textTheme.bodySmall,
              ),
              if (transaction?.dateTime != null)
                Padding(
                  padding: context.insetsSymetric(horizontal: 8),
                  child: const CircleAvatar(
                    radius: 2,
                    backgroundColor: AppColors.neutralN400,
                  ),
                ),
              Text(
                '${transaction?.dateTime ?? ''}',
                style: context.textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
