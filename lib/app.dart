import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_pages.dart';
import 'package:flutter_template/app/app_routes.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/utils/locale_string.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      title: "Flutter architect template",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPages.getPages,
    );
  }
}
