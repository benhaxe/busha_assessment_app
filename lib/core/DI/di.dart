import 'package:busha_app/app/explore/data/repo_impl/explore_repo_impl.dart';
import 'package:busha_app/app/explore/domain/repo/explore_repo.dart';
import 'package:busha_app/app/explore/domain/use_cases/get_my_assets.dart';
import 'package:busha_app/app/explore/domain/use_cases/get_top_movers.dart';
import 'package:busha_app/app/explore/domain/use_cases/get_trending_news.dart';
import 'package:busha_app/app/explore/presentation/logic/explore_logics.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

void setupDI() {
  //[REPOs]
  locator.registerLazySingleton<ExploreRepo>(() => ExploreRepoImpl());

  //[UseCases]
  locator.registerLazySingleton(() => GetMyAssets(locator()));
  locator.registerLazySingleton(() => GetTopMovers(locator()));
  locator.registerLazySingleton(() => GetTrendingNews(locator()));

  //[UI Logics]
  locator.registerLazySingleton(() => ExploreLogics(
        locator(),
        locator(),
        locator(),
      ));
}
