import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_pages.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/utils/locale_string.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      translations: LocaleString(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      title: "Flutter architect template",
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
        accentColor: Colors.green.shade600,
      ),
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPages.getPages,
    );
  }
}
