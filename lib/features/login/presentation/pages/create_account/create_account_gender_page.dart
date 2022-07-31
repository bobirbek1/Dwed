import 'package:flutter/material.dart';
import 'package:flutter_template/app/app_colors.dart';
import 'package:flutter_template/core/utils/size_config.dart';
import 'package:flutter_template/features/login/presentation/widgets/login_page_skeleton.dart';

class CreateAccountGenderPage extends StatefulWidget {
  const CreateAccountGenderPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountGenderPage> createState() =>
      _CreateAccountGenderPageState();
}

class _CreateAccountGenderPageState extends State<CreateAccountGenderPage> {
  int _radioValue = 1;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoginPageSkeleton(
      canBack: true,
      headerHeight: 286,
      title: "CREATE ACCOUNT",
      subtitle: "Enter the full name you use in real life",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              const Text(
                "What's your gender?",
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
                "You can change who sees your gender on\n your profile later",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              getRadio("Male", 1),
              getRadio("Female", 2),
              getRadio("Prefer not to say", 3),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
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
                  child: const Text(
                    "NEXT",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getRadio(String text, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
        Transform.scale(
          scale: 1.2,
          child: Radio(
            value: index,
            groupValue: _radioValue,
            onChanged: (val) {
              if(val != _radioValue) {
                setState(() {
                _radioValue = val as int;
              });
              }
            },
            activeColor: AppColors.MAXSIMUM_BLUE_GREEN,
          ),
        ),
      ],
    );
  }
}
