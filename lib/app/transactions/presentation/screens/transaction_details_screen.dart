import 'package:busha_app/app/transactions/domain/entities/transaction.dart';
import 'package:busha_app/app/transactions/presentation/widget/transaction_details_item.dart';
import 'package:busha_app/src/scaler/scaler.dart';
import 'package:busha_app/views/components/app_bar/app_bar.dart';
import 'package:flutter/material.dart';

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({
    super.key,
    required this.transaction,
  });
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
        title: 'Transaction Details',
      ),
      body: Padding(
        padding: context.insetsAll(20),
        child: Column(
          children: [
            TransactionDetailsItem(
              label: 'Hash',
              value: transaction.hash ?? '',
            ),
            TransactionDetailsItem(
              label: 'Time',
              value: '${transaction.dateTime ?? ''}',
            ),
            TransactionDetailsItem(
              label: 'Size',
              value: ' ${transaction.size ?? ''}',
            ),
            TransactionDetailsItem(
              label: 'Block Index',
              value: ' ${transaction.blockIndex ?? ''}',
            ),
            TransactionDetailsItem(
              label: 'Height',
              value: ' ${transaction.height ?? ''}',
            ),
            TransactionDetailsItem(
              label: 'Received time',
              value: ' ${transaction.dateTime ?? ''}',
              isLast: true,
            ),
            const YMargin(16),
            const Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
