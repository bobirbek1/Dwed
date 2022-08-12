import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Home page",style: TextStyle(fontSize: 48,color: AppColors.BLACK,),),),
    );
  }
}
