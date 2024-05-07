import 'package:busha_app/core/mixins/mixins.dart';
import 'package:busha_app/app/explore/domain/entities/my_asset.dart';
import 'package:busha_app/app/explore/domain/repo/explore_repo.dart';

class GetTopMovers with UseCases<List<Asset>> {
  final ExploreRepo _exploreRepo;

  GetTopMovers(this._exploreRepo);

  @override
  Future<List<Asset>> call() => _exploreRepo.getTopMovers();
}
