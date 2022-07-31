import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String? buttonText;

  const LoginButton({this.buttonText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(
            56,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
        ),
        child: Text(
          buttonText ?? "",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
