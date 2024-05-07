import 'package:busha_app/core/DI/di.dart';
import 'package:busha_app/app/explore/domain/entities/my_asset.dart';
import 'package:busha_app/app/explore/presentation/logic/explore_logics.dart';
import 'package:busha_app/app/explore/presentation/widgets/todays_top_mover_item.dart';
import 'package:busha_app/src/extensions/src/context_on_theme_extension.dart';
import 'package:busha_app/src/scaler/scaler.dart';
import 'package:busha_app/src/values/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodaysTopMoversView extends StatefulWidget {
  const TodaysTopMoversView({super.key});

  @override
  State<TodaysTopMoversView> createState() => _TodaysTopMoversViewState();
}

class _TodaysTopMoversViewState extends State<TodaysTopMoversView> {
  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: locator.get<ExploreLogics>().getTodayTopMovers(),
      builder: (_, AsyncSnapshot<List<Asset>> snapshot) {
        if (snapshot.data == null) {
          return const Offstage();
        }

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
                    "Today's Top Movers",
                    style: context.textTheme.titleSmall,
                  ),
                  Text(
                    'See all',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.primaryGreen,
                    ),
                  ),
                ],
              ),
              const YMargin(20),
              LayoutBuilder(builder: (context, constraint) {
                return SizedBox(
                  height: context.scaleY(135),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: data?.length ?? 0,
                    itemBuilder: (context, index) => TodaysTopMoverItem(
                      asset: data![index],
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
