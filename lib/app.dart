import 'package:flutter/material.dart';
import 'package:flutter_template/features/login/presentation/pages/create_account/creat_account_date_page.dart';
import 'package:flutter_template/features/login/presentation/pages/create_account/create_account_live.dart';

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
      home: const CreateAccountLive(),
    );
  }
}
