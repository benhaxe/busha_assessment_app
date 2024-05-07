import 'package:flutter/material.dart';

abstract class AppColors {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppColors._();

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF101A26);

  //PRIMARY PALETTE
  static const Color primaryGreen = Color(0xFF1A9D29);
  static const Color primaryRed = Color(0xFFBE2725);

  static const Color unSelectedNavBarColor = Color(0xFF918F9B);

  //TextPark PALETTE
  static const Color headingOne = Color(0xFF1D2532);
  static const Color subHeading = Color(0xFF8B8B8B);
  static const Color subHeading2 = Color(0xFF9C9C9C);
  static const Color dateText = Color(0xFF1B2031);

  //NEUTRAL
  static const Color neutralN800 = Color(0xFF122535);
  static const Color neutralN600 = Color(0xFF2E4457);
  static const Color neutralN500 = Color(0xFF4D6173);
  static const Color neutralN400 = Color(0xFF98A7B4);
  static const Color neutralN300 = Color(0xFFC2CDD6);
  static const Color neutralN200 = Color(0xFFD9E1E8);
  static const Color neutralN100 = Color(0xFFE4EBF1);
  static const Color neutralN75 = Color(0xFFEDF2F7);
  static const Color neutralN50 = Color(0xFFF5F7FA);

  static const Color dividerColor = Color(0xFFF2F3F7);
}
