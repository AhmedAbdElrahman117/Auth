import 'package:auth/Features/login/presentation/view/widgets/sign_button.dart';
import 'package:auth/Features/login/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key,
      required this.gKey,
      required this.emailController,
      required this.passwordController});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> gKey;

  @override
  Widget build(BuildContext context) {
    return SignButton(
      title: 'Login',
      onPressed: () {
        if (gKey.currentState!.validate()) {
          BlocProvider.of<LoginCubit>(context).loginWithEmail(
            email: emailController.text,
            pass: passwordController.text,
          );
        }
      },
    );
  }
}
