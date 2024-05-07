import 'package:busha_app/core/DI/di.dart';
import 'package:busha_app/busha_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //Setup Service locator, using this for dependency Injection, which will also aid easy Unit test.
  setupDI();

  runApp(const BushaApp());
}
