import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String? buttonText;
  final Widget? child;
  final Function() onPressed;

   const LoginButton({required this.onPressed, this.buttonText,this.child, Key? key})
      : assert(buttonText == null && child != null || buttonText != null && child == null), super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          fixedSize: const Size.fromHeight(
            56,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              6,
            ),
          ),
        ),
        child: buttonText != null ? Text(
          buttonText ?? "",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ) : child,
      ),
    );
  }
}
