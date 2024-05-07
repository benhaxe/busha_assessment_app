import 'package:busha_app/app/transactions/domain/entities/transaction.dart';
import 'package:busha_app/app/transactions/domain/repo/transaction_repo.dart';
import 'package:busha_app/core/mixins/mixins.dart';

class GetTransactions with UseCases<List<Transaction>, String> {
  final TransactionRepo _transactionRepo;

  GetTransactions(this._transactionRepo);

  @override
  Future<List<Transaction>> call(String params) =>
      _transactionRepo.getTransactionsInLatestBlock(params);
}
