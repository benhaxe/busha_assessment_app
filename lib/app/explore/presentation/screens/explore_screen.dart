import 'package:busha_app/app/explore/presentation/views/my_asset_view.dart';
import 'package:busha_app/app/explore/presentation/views/my_balance.dart';
import 'package:busha_app/app/explore/presentation/views/today_top_movers.dart';
import 'package:busha_app/app/explore/presentation/views/trending_news_view.dart';
import 'package:busha_app/src/scaler/scaler.dart';
import 'package:busha_app/src/values/assets/svg.dart';
import 'package:busha_app/views/components/app_bar/app_bar.dart';
import 'package:busha_app/views/widgets/app_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        key: const ValueKey('explore-screen-app-bar'),
        title: 'Explore',
        leading: SvgPicture.asset(kSVGAppBarScan),
        actions: [
          SvgPicture.asset(kSVGSearch),
          const XMargin(16),
          SvgPicture.asset(kSVGNotification),
          const XMargin(16),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            YMargin(20),
            MyBalanceView(),
            AppHorizontalDivider(),
            MyAssetView(),
            AppHorizontalDivider(),
            TodaysTopMoversView(),
            AppHorizontalDivider(),
            TrendingNewsView(),
            YMargin(24),
          ],
        ),
      ),
    );
  }
}
