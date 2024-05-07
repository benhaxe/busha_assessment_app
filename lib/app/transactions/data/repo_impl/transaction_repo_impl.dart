import 'package:busha_app/app/transactions/data/models/transaction_models.dart';
import 'package:busha_app/app/transactions/domain/entities/transaction.dart';
import 'package:busha_app/app/transactions/domain/repo/transaction_repo.dart';
import 'package:busha_app/core/client/api/api_client.dart';

class TransactionRepoImpl extends TransactionRepo {
  final AppApiClient _apiClient;
  TransactionRepoImpl(this._apiClient);

  @override
  Future<Transaction> getLatestBlock() async {
    final response = await _apiClient.get('/latestblock');

    return TransactionModel.fromJson(response.data);
  }

  @override
  Future<List<Transaction>> getTransactionsInLatestBlock(String hash) async {
    final result = await _apiClient.get('/rawblock/$hash');
    final transactionsInHash = result.data['tx'];

    List<Transaction> transactions = [];
    for (Map<String, dynamic> json in transactionsInHash) {
      final response = TransactionModel.fromJson(json);
      transactions.add(response);
    }

    return transactions;
  }
}
