import 'package:busha_app/src/values/assets/images.dart';
import 'package:equatable/equatable.dart';

class TrendingNews extends Equatable {
  final String? id;
  final String? banner;
  final String? title;
  final String? channel;
  final String? dateTime;
  final bool? isFeatured;

  const TrendingNews({
    this.id,
    this.banner,
    this.title,
    this.channel,
    this.dateTime,
    this.isFeatured,
  });
  String get trendingNewsBanerFallBack {
    if (id == null || id!.isEmpty) return kIMGTrendingNewsBanner;

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

  @override
  List<Object?> get props => [id, banner, title, channel, dateTime, isFeatured];
}
