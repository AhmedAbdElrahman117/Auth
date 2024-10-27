import 'package:auth/Features/login/presentation/view/widgets/logo.dart';
import 'package:auth/Features/signup/data/user_data.dart';
import 'package:auth/Features/signup/presentation/view/widgets/otp_input.dart';
import 'package:auth/Features/signup/presentation/view/widgets/resend_code_button.dart';
import 'package:flutter/material.dart';

class EmailConfirm extends StatelessWidget {
  const EmailConfirm({super.key, required this.userData});

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo(),
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 30),
              child: Text(
                'Verify Email',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'OTP Sent to ${userData.email}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            OTPInput(userData: userData),
            ResendCodeButton(userData: userData),
          ],
        ),
      ),
    );
  }
}
