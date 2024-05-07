import 'dart:convert';

import 'package:busha_app/app/explore/domain/repo/explore_repo.dart';
import 'package:busha_app/app/explore/data/models/my_asset_model.dart';
import 'package:busha_app/app/explore/data/models/trending_news_model.dart';
import 'package:flutter/services.dart';

class ExploreRepoImpl implements ExploreRepo {
  @override
  Future<List<AssetModel>> getMyAssets() async {
    final String response = await rootBundle.loadString('fixtures/assets.json');

    final data = await json.decode(response) as List;

    //Using wallet balance here to indicate assets that are mine.
    List<AssetModel> parsedAssetModel = data
        .map((e) => AssetModel.fromJson(e))
        .where((item) => item.walletBalance != null)
        .toList();

    return parsedAssetModel;
  }

  @override
  Future<List<AssetModel>> getTopMovers() async {
    final String response = await rootBundle.loadString('fixtures/assets.json');

    final data = await json.decode(response) as List;

    //**[DUMMY LOGIC]**
    //Using abscence of wallet balance here to indicate assets that are top movers.
    List<AssetModel> parsedAssetModel = data
        .map((e) => AssetModel.fromJson(e))
        .where((item) => item.walletBalance == null)
        .toList();

    return parsedAssetModel;
  }

  @override
  Future<List<TrendingNewsModel>> getTrendingNews() async {
    final String response =
        await rootBundle.loadString('fixtures/trending_news.json');

    final data = await json.decode(response) as List;

    //**[DUMMY LOGIC]**
    //Using wallet balance here to indicate assets that are mine.
    List<TrendingNewsModel> parsedTrendingNewsModel =
        data.map((e) => TrendingNewsModel.fromJson(e)).toList();

    return parsedTrendingNewsModel;
  }
}
