import 'package:auth/Features/login/presentation/view/widgets/custom_button.dart';
import 'package:auth/Features/login/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Login With Google',
      icon: 'assets/images/google.png',
      onPressed: () {
        BlocProvider.of<LoginCubit>(context).googleLogin();
      },
    );
  }
}
