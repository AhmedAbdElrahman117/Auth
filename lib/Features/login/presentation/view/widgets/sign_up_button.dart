import 'package:auth/Features/login/presentation/view/widgets/sign_button.dart';
import 'package:auth/Features/signup/presentation/view/sign_up_view.dart';
import 'package:auth/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SignButton(
      title: 'Sign up',
      onPressed: () {
        Get.to(
          () => const SignUpView(),
          transition: kTrans,
        );
      },
    );
  }
}
