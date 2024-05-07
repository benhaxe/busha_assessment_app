import 'package:busha_app/app/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:busha_app/src/scaler/scaler.dart';
import 'package:busha_app/src/theme/app_theme.dart';

class BushaApp extends StatelessWidget {
  const BushaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleAware(
      config: const ScaleConfig(
        width: 375,
        height: 812,
      ),
      child: Builder(builder: (builderContext) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BushaApp',
          theme: AppTheme(builderContext).lightTheme,
          home: const LoginScreen(),
        );
      }),
    );
  }
}
