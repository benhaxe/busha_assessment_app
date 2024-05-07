import 'package:busha_app/app/transactions/domain/entities/transaction.dart';
import 'package:busha_app/app/transactions/domain/use_cases/get_latest_block.dart';
import 'package:busha_app/app/transactions/domain/use_cases/get_transactions.dart';
import 'package:busha_app/core/mixins/mixins.dart';

class TransactionLogic {
  final GetLatestBlock _getLatestBlock;
  final GetTransactions _getTransactions;

  TransactionLogic(
    this._getLatestBlock,
    this._getTransactions,
  );

  Future<Transaction> _getHashFromLatestBlock() =>
      _getLatestBlock.call(NoParams());

  Future<List<Transaction>> getTransactions() async {
    final transactions = await _getHashFromLatestBlock()
        .then((transaction) => _getTransactions.call(transaction.hash!));

    return transactions;
  }
}
