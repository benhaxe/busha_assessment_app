import 'package:busha_app/views/components/app_bar/app_bar.dart';
import 'package:flutter/material.dart';

class EarnScreen extends StatelessWidget {
  const EarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: KAppBar(
        title: 'Earn',
        canPop: false,
      ),
      body: Center(
        child: Text('Coming Soon...'),
      ),
    );
  }
}
