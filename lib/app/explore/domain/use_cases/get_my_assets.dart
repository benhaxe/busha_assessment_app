import 'package:busha_app/core/mixins/mixins.dart';
import 'package:busha_app/app/explore/domain/entities/my_asset.dart';
import 'package:busha_app/app/explore/domain/repo/explore_repo.dart';

class GetMyAssets with UseCases<List<Asset>, NoParams> {
  final ExploreRepo _exploreRepo;

  GetMyAssets(this._exploreRepo);

  @override
  Future<List<Asset>> call(NoParams params) => _exploreRepo.getMyAssets();
}
