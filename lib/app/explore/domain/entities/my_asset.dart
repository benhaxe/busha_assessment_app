import 'package:busha_app/src/values/assets/images.dart';
import 'package:equatable/equatable.dart';

class Asset extends Equatable {
  final String? id;
  final String? logo;
  final String? coin;
  final String? abbreviation;
  final num? indication;
  final num? walletBalance;
  final bool? isTodayMover;

  const Asset({
    this.id,
    this.logo,
    this.coin,
    this.abbreviation,
    this.indication,
    this.walletBalance,
    this.isTodayMover,
  });

  String get coinLogoFallBack {
    if (id == null || id!.isEmpty) return kIMGBusha;

    switch (id) {
      case 'btc':
      case 'btc_mover':
        return kIMGBitcoin;
      case 'eth':
      case 'eth_mover':
        return kIMGEthereumTheter;
      case 'polygon':
        return kIMGPolygon;
      case 'tez':
        return kIMGTezos;
      case 'solana':
      case 'solana_mover':
        return kIMGSolana;
      default:
        return kIMGBusha;
    }
  }

  bool get isGaining {
    try {
      return indication! / 100 >= 6;
    } catch (_) {
      return false;
    }
  }

  @override
  List<Object?> get props => [id, logo, coin, indication, walletBalance];
}
