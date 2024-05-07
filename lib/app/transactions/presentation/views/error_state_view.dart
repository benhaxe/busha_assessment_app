import 'package:flutter/material.dart';

class ErrorStateView extends StatelessWidget {
  const ErrorStateView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'There are seems to be a problem on our path, please try again later',
        textAlign: TextAlign.center,
      ),
    );
  }
}
