import 'package:busha_app/app/explore/domain/entities/my_asset.dart';

class AssetModel extends Asset {
  const AssetModel({
    super.id,
    super.logo,
    super.coin,
    super.indication,
    super.abbreviation,
    super.walletBalance,
    super.isTodayMover,
  });

  factory AssetModel.fromJson(Map<String, dynamic> json) {
    return AssetModel(
      id: json['id'],
      logo: json['logo'],
      coin: json['coin'],
      abbreviation: json['abbreviation'],
      indication: json['indication'],
      walletBalance: json['walletBalance'],
      isTodayMover: json['isTodayMover'],
    );
  }
}
