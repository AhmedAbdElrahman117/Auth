import 'package:auth/Features/signup/presentation/view/widgets/register_info.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: RegisterInfo(),
      ),
    );
  }
}
