import 'package:busha_app/app/explore/data/repo_impl/explore_repo_impl.dart';
import 'package:busha_app/app/explore/domain/repo/explore_repo.dart';
import 'package:busha_app/app/explore/domain/use_cases/get_my_assets.dart';
import 'package:busha_app/app/explore/domain/use_cases/get_top_movers.dart';
import 'package:busha_app/app/explore/domain/use_cases/get_trending_news.dart';
import 'package:busha_app/app/explore/presentation/logic/explore_logics.dart';
import 'package:busha_app/app/transactions/data/repo_impl/transaction_repo_impl.dart';
import 'package:busha_app/app/transactions/domain/repo/transaction_repo.dart';
import 'package:busha_app/app/transactions/domain/use_cases/get_latest_block.dart';
import 'package:busha_app/app/transactions/domain/use_cases/get_transactions.dart';
import 'package:busha_app/app/transactions/presentation/logic/transaction_logic.dart';
import 'package:busha_app/core/client/api/api_client.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

void setupDI() {
  locator.registerLazySingleton<AppApiClient>(() => AppApiClient());

  //[REPOs]
  locator.registerLazySingleton<ExploreRepo>(() => ExploreRepoImpl());
  locator.registerLazySingleton<TransactionRepo>(
      () => TransactionRepoImpl(locator()));

  //[UseCases]
  //--Explore
  locator.registerLazySingleton(() => GetMyAssets(locator()));
  locator.registerLazySingleton(() => GetTopMovers(locator()));
  locator.registerLazySingleton(() => GetTrendingNews(locator()));

  //--Transaction
  locator.registerLazySingleton(() => GetLatestBlock(locator()));
  locator.registerLazySingleton(() => GetTransactions(locator()));

  //[UI Logics]
  //--Explore
  locator.registerLazySingleton(
    () => ExploreLogics(
      locator(),
      locator(),
      locator(),
    ),
  );

  //--Transaction
  locator.registerLazySingleton(
    () => TransactionLogic(
      locator(),
      locator(),
    ),
  );
}
