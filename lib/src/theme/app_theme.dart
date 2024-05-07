import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:busha_app/src/theme/text_theme.dart';
import 'package:busha_app/src/values/colors/colors.dart';

class AppTheme {
  final BuildContext context;

  const AppTheme(this.context);

  ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: _lightColorScheme,
        scaffoldBackgroundColor: _lightColorScheme.surface,
        appBarTheme: AppBarTheme(
          scrolledUnderElevation: 0.0,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.white),
          titleTextStyle: Theme.of(context).textTheme.bodyLarge!.apply(
                color: AppColors.white,
              ),
        ),
        textTheme: GoogleFonts.interTextTheme(),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          enableFeedback: true,
          selectedIconTheme: IconThemeData(color: AppColors.black),
          unselectedIconTheme: IconThemeData(
            color: AppColors.unSelectedNavBarColor,
          ),
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        ),
        extensions: <ThemeExtension<dynamic>>[
          AppTextTheme.fallback(context),
        ],
      );
}

ColorScheme get _lightColorScheme => ColorScheme.fromSwatch().copyWith(
      primary: AppColors.black,
      secondary: AppColors.primaryRed,
      surface: AppColors.neutralN50,
      onBackground: Colors.black,
      onSecondary: AppColors.black,
    );
