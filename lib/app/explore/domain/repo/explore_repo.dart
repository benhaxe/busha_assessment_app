import 'package:busha_app/app/explore/domain/entities/my_asset.dart';
import 'package:busha_app/app/explore/domain/entities/trending_news.dart';

abstract class ExploreRepo {
  Future<List<Asset>> getMyAssets();
  Future<List<Asset>> getTopMovers();
  Future<List<TrendingNews>> getTrendingNews();
}
