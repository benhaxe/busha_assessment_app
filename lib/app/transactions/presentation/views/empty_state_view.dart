import 'package:flutter/material.dart';

class EmptyStateView extends StatelessWidget {
  const EmptyStateView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'There are no transaction, please check back later',
        textAlign: TextAlign.center,
      ),
    );
  }
}
