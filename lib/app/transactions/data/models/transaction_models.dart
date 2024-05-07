import 'package:busha_app/app/transactions/domain/entities/transaction.dart';

class TransactionModel extends Transaction {
  const TransactionModel({
    super.hash,
    super.dateTime,
    super.size,
    super.blockIndex,
    super.height,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      hash: json['hash'],
      dateTime: json['time'],
      size: json['size'],
      blockIndex: json['block_index'],
      height: json['block_height'],
    );
  }
}
