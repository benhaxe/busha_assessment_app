import 'package:busha_app/app/transactions/domain/entities/transaction.dart';
import 'package:busha_app/app/transactions/domain/repo/transaction_repo.dart';
import 'package:busha_app/core/mixins/mixins.dart';

class GetLatestBlock with UseCases<Transaction, NoParams> {
  final TransactionRepo _transactionRepo;

  GetLatestBlock(this._transactionRepo);

  @override
  Future<Transaction> call(NoParams params) =>
      _transactionRepo.getLatestBlock();
}
