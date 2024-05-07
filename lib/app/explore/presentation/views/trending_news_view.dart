import 'package:busha_app/core/DI/di.dart';
import 'package:busha_app/app/explore/domain/entities/trending_news.dart';
import 'package:busha_app/app/explore/presentation/logic/explore_logics.dart';
import 'package:busha_app/app/explore/presentation/widgets/featured_trending_news_item.dart';
import 'package:busha_app/app/explore/presentation/widgets/trending_news_item.dart';
import 'package:busha_app/src/extensions/src/context_on_theme_extension.dart';
import 'package:busha_app/src/scaler/scaler.dart';
import 'package:busha_app/src/values/colors/colors.dart';
import 'package:busha_app/views/widgets/app_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TrendingNewsView extends StatefulWidget {
  const TrendingNewsView({super.key});

  @override
  State<TrendingNewsView> createState() => _TrendingNewsViewState();
}

class _TrendingNewsViewState extends State<TrendingNewsView> {
  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: locator.get<ExploreLogics>().getOtherTrendingNews(),
      /* future: Future.wait([
        locator.get<ExploreLogics>().getFeaturedTrendingNews(),
        locator.get<ExploreLogics>().getOtherTrendingNews()
      ]), */
      builder: (_, AsyncSnapshot<List<TrendingNews>> snapshot) {
        if (snapshot.data == null) {
          return const Offstage();
        }

        /* final featuredNewsData = snapshot.data?[0];
        final otherNewsData = snapshot.data?[1]; */
        final data = snapshot.data;

        return Padding(
          padding: context.insetsSymetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trending News",
                    style: context.textTheme.titleSmall,
                  ),
                  Text(
                    'View More',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.primaryGreen,
                    ),
                  ),
                ],
              ),
              const YMargin(20),
              FeaturedTrendingNewsItem(
                trendingNews: data!.first,
              ),
              const AppHorizontalDivider(topMargin: 12, bottomMargin: 12),
              SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) => TrendingNewsItem(
                    trendingNews: data[index],
                  ),
                  separatorBuilder: (context, index) =>
                      const AppHorizontalDivider(
                    topMargin: 12,
                    bottomMargin: 12,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
