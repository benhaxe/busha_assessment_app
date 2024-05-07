import 'package:busha_app/core/mixins/mixins.dart';
import 'package:busha_app/app/explore/domain/entities/trending_news.dart';
import 'package:busha_app/app/explore/domain/repo/explore_repo.dart';

class GetTrendingNews with UseCases<List<TrendingNews>> {
  final ExploreRepo _exploreRepo;

  GetTrendingNews(this._exploreRepo);

  @override
  Future<List<TrendingNews>> call() => _exploreRepo.getTrendingNews();
}
