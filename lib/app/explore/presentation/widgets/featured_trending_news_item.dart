import 'package:busha_app/app/explore/domain/entities/trending_news.dart';
import 'package:busha_app/src/extensions/extensions.dart';
import 'package:busha_app/src/scaler/scaler.dart';
import 'package:busha_app/src/values/assets/images.dart';
import 'package:busha_app/src/values/colors/colors.dart';

import 'package:flutter/material.dart';

class FeaturedTrendingNewsItem extends StatelessWidget {
  const FeaturedTrendingNewsItem({
    super.key,
    this.trendingNews,
  });

  final TrendingNews? trendingNews;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            kIMGTrendingNewsBanner,
            fit: BoxFit.fill,
          ),
        ),
        const YMargin(16),
        Text(
          trendingNews?.title ?? '',
          style: context.textTheme.bodyMedium,
        ),
        const YMargin(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          verticalDirection: VerticalDirection.up,
          children: [
            Text(
              trendingNews?.channel ?? '',
              style: context.textTheme.bodySmall,
            ),
            if (trendingNews?.dateTime != null &&
                trendingNews!.dateTime!.timeDayAgo.isNotEmpty)
              Padding(
                padding: context.insetsSymetric(horizontal: 8),
                child: const CircleAvatar(
                  radius: 2,
                  backgroundColor: AppColors.neutralN400,
                ),
              ),
            Text(
              trendingNews?.dateTime?.timeDayAgo ?? '',
              style: context.textTheme.bodySmall,
            ),
          ],
        )
      ],
    );
  }
}
