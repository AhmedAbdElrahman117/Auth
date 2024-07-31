import 'package:auth/Features/login/presentation/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/login_cubit/login_cubit.dart';

class FacebookLoginButton extends StatelessWidget {
  const FacebookLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Login With Facebook',
      icon: 'assets/images/facebook.png',
      onPressed: () {
        BlocProvider.of<LoginCubit>(context).loginWithFacebook();
      },
    );
  }
}
