import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String? hash;
  final num? dateTime;
  final num? size;
  final num? blockIndex;
  final num? height;

  const Transaction({
    this.hash,
    this.dateTime,
    this.size,
    this.blockIndex,
    this.height,
  });

  @override
  List<Object?> get props => [hash, dateTime, size, blockIndex, height];
}
