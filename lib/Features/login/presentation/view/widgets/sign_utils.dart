import 'package:auth/Features/login/presentation/view/widgets/forgot_button.dart';
import 'package:auth/Features/login/presentation/view/widgets/remember_button.dart';
import 'package:flutter/material.dart';

class SignUtils extends StatelessWidget {
  const SignUtils({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        right: 12,
        left: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RememberButton(),
          ForgotButton(),
        ],
      ),
    );
  }
}
