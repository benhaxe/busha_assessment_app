import 'package:busha_app/core/DI/di.dart';
import 'package:busha_app/app/explore/domain/entities/my_asset.dart';
import 'package:busha_app/app/explore/presentation/logic/explore_logics.dart';
import 'package:busha_app/app/explore/presentation/widgets/my_asset_item.dart';
import 'package:busha_app/src/extensions/src/context_on_theme_extension.dart';
import 'package:busha_app/src/scaler/scaler.dart';
import 'package:busha_app/src/values/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyAssetView extends StatefulWidget {
  const MyAssetView({super.key});

  @override
  State<MyAssetView> createState() => _MyAssetViewState();
}

class _MyAssetViewState extends State<MyAssetView> {
  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: locator.get<ExploreLogics>().getMyAssets(),
      builder: (_, AsyncSnapshot<List<Asset>> snapshot) {
        if (snapshot.data == null) {
          return const Offstage();
        }

        final data = snapshot.data;

        return Padding(
          padding: context.insetsSymetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My assets',
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
              LayoutBuilder(builder: (context, constraint) {
                return SizedBox(
                  height: context.scaleY(250),
                  child: ListView.builder(
                    shrinkWrap: true,
                    addRepaintBoundaries: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: context.insetsSymetric(vertical: 8),
                    itemCount: data?.length ?? 0,
                    itemBuilder: (context, index) => MyAssetItem(
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
