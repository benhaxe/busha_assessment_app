import 'package:busha_app/app/transactions/domain/entities/transaction.dart';

abstract class TransactionRepo {
  Future<Transaction> getLatestBlock();
  Future<List<Transaction>> getTransactionsInLatestBlock(String hash);
}
