import 'package:busha_app/src/values/colors/colors.dart';
import 'package:flutter/material.dart';

class LoadingStateView extends StatelessWidget {
  const LoadingStateView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: AppColors.primaryGreen,
        color: AppColors.white,
      ),
    );
  }
}
