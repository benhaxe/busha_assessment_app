import 'package:busha_app/app/explore/domain/entities/my_asset.dart';
import 'package:busha_app/app/explore/domain/entities/trending_news.dart';
import 'package:busha_app/app/explore/domain/use_cases/get_my_assets.dart';
import 'package:busha_app/app/explore/domain/use_cases/get_top_movers.dart';
import 'package:busha_app/app/explore/domain/use_cases/get_trending_news.dart';
import 'package:busha_app/core/mixins/mixins.dart';

class ExploreLogics {
  final GetMyAssets _myAssets;
  final GetTopMovers _topMovers;
  final GetTrendingNews _trendingNews;

  ExploreLogics(
    this._myAssets,
    this._topMovers,
    this._trendingNews,
  );

  Future<List<Asset>> getMyAssets() => _myAssets.call(NoParams());

  Future<List<Asset>> getTodayTopMovers() => _topMovers.call(NoParams()).then(
      (value) => value.where((item) => item.isTodayMover == true).toList());

  Future<List<TrendingNews>> getFeaturedTrendingNews() => _trendingNews
      .call(NoParams())
      .then((value) => value.where((item) => item.isFeatured == true).toList());

  Future<List<TrendingNews>> getOtherTrendingNews() =>
      _trendingNews.call(NoParams());
}
