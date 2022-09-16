import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/app.dart';

import 'injection_container.dart' as di;

void main(List<String> args) async {
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // statusBarIconBrightness: Brightness.light,
  ));
  // Initialize the injection container
  await di.init();
  print("main function worked after init");

  // Run the app
  runApp(const MyApp());
}
