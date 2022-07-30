import 'package:flutter/material.dart';

import '../../widgets/login_page_skeleton.dart';

class CreateAccountNamePage extends StatelessWidget {
  const CreateAccountNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget textField(String labelText) {
      return Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      );
    }

    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "CREATE ACCOUNT",
      subtitle: "Enter the full name you use in real life",
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "What\'s your name?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Enter the full name you use in real life",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            textField("Name"),
            textField("Surname"),
            textField("Additional name"),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(393, 56),
              ),
              onPressed: () {},
              child: const Text(
                "NEXT",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
