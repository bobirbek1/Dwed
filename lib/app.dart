import 'package:flutter/material.dart';
import 'package:flutter_template/features/login/presentation/pages/splash/on_boarding_page.dart';

import 'features/login/presentation/pages/login/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter architect templete",
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
        accentColor: Colors.green.shade600,
      ),
      home: const OnBoardingPage(),
    );
  }
}
