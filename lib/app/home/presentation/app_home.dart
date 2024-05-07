import 'package:busha_app/app/connect/connect_screen.dart';
import 'package:busha_app/app/earn/earn_screen.dart';
import 'package:busha_app/app/explore/presentation/screens/explore_screen.dart';
import 'package:busha_app/app/portfolio/potfolio_screen.dart';
import 'package:busha_app/app/spend/spend_screen.dart';
import 'package:busha_app/src/values/assets/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int currentIndex = 0;
  List<Widget> children = [
    const ExploreScreen(),
    const PortfolioScreen(),
    const EarnScreen(),
    const SpendScreen(),
    const ConnectScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() {
          currentIndex = value;
        }),
        selectedItemColor: Theme.of(context).colorScheme.onSecondary,
        unselectedItemColor:
            Theme.of(context).colorScheme.onBackground.withOpacity(.6),
        showUnselectedLabels: true,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(kSVGNavBarPotfolio),
            label: "Portfolio",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(kSVGNavBarEarn),
            label: "Earn",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(kSVGNavBarSpend),
            label: "Spend",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(kSVGNavBarConnect),
            label: "Connect",
          ),
        ],
      ),
    );
  }
}
