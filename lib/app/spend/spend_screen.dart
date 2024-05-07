import 'package:busha_app/views/components/app_bar/app_bar.dart';
import 'package:flutter/material.dart';

class SpendScreen extends StatelessWidget {
  const SpendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: KAppBar(
        title: 'Spend',
        canPop: false,
      ),
      body: Center(
        child: Text('Coming Soon...'),
      ),
    );
  }
}
