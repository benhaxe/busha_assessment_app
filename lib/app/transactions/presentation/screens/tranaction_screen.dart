import 'package:busha_app/app/transactions/domain/entities/transaction.dart';
import 'package:busha_app/app/transactions/presentation/logic/transaction_logic.dart';
import 'package:busha_app/app/transactions/presentation/views/empty_state_view.dart';
import 'package:busha_app/app/transactions/presentation/views/error_state_view.dart';
import 'package:busha_app/app/transactions/presentation/views/loading_state_view.dart';
import 'package:busha_app/app/transactions/presentation/widget/transaction_item.dart';
import 'package:busha_app/core/DI/di.dart';
import 'package:busha_app/src/scaler/src/extensions.dart';

import 'package:busha_app/views/components/app_bar/app_bar.dart';
import 'package:busha_app/views/widgets/app_divider.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
        title: 'BTC Transactions',
      ),
      body: Padding(
        padding: context.insetsSymetric(horizontal: 20, vertical: 8),
        child: FutureBuilder(
            future: locator.get<TransactionLogic>().getTransactions(),
            builder: (context, AsyncSnapshot<List<Transaction>> snapshot) {
              final data = snapshot.data;

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingStateView();
              }
              if (snapshot.hasError) {
                return const ErrorStateView();
              }
              if (data == null) {
                return const EmptyStateView();
              }
              //TODO:Optimize list view to not load all data at once.
              return ListView.separated(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) => TransactionItem(
                  transaction: data[index],
                ),
                separatorBuilder: (context, index) =>
                    const AppHorizontalDivider(
                  topMargin: 12,
                  bottomMargin: 12,
                ),
              );
            }),
      ),
    );
  }
}
