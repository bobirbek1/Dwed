import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/src/presentation/pages/cart/cart_page.dart';
import 'package:flutter_template/src/presentation/pages/checkout/checkout_page.dart';
import 'package:flutter_template/src/presentation/pages/checkout_ordered/checkout_ordered_page.dart';
import 'package:flutter_template/src/presentation/pages/checkout_payment_method_1/checkout_payment_method_1_page.dart';
import 'package:flutter_template/src/presentation/pages/information/information_page.dart';

import 'injection_container.dart' as di;

void main(List<String> args) async {
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // statusBarIconBrightness: Brightness.light,
    ),
  );
  // Initialize the injection container
  await di.init();
  print("main function worked after init");

  // Run the app
  runApp(const MyApp());
}
