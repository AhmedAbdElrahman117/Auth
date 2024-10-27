import 'package:auth/Features/login/presentation/view/widgets/facebook_login_button.dart';
import 'package:auth/Features/login/presentation/view/widgets/google_login_button.dart';
import 'package:auth/Features/login/presentation/view/widgets/twitter_login_button.dart';
import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GoogleLoginButton(),
          FacebookLoginButton(),
          TwitterLoginButton(),
        ],
      ),
    );
  }
}
