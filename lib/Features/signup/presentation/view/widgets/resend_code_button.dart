import 'package:auth/Features/signup/data/user_data.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';

class ResendCodeButton extends StatelessWidget {
  const ResendCodeButton({
    super.key,
    required this.userData,
  });

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await EmailOTP.sendOTP(email: userData.email);
      },
      child: const Text(
        'Resend Code',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
