import 'package:auth/Features/login/presentation/view/widgets/email_text_field.dart';
import 'package:auth/Features/login/presentation/view/widgets/logo.dart';
import 'package:auth/Features/login/presentation/view/widgets/password_text_field.dart';
import 'package:auth/Features/login/presentation/view/widgets/sign_button.dart';
import 'package:auth/Features/signup/data/user_data.dart';
import 'package:auth/Features/signup/presentation/view/email_confirm.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    GlobalKey<FormState> gKey = GlobalKey();
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: gKey,
          child: ListView(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.16),
              const Logo(),
              const Text(
                'Sign Up',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 25),
              EmailTextField(
                emailController: emailController,
                hintText: 'Enter your Email',
                labelText: 'Email Address',
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'Email Required';
                //   } else {
                //     return null;
                //   }
                // },
              ),
              const SizedBox(height: 25),
              PasswordTextField(
                passwordController: passwordController,
                hintText: ' Enter you Password',
                labelText: 'Password',
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'Password Required';
                //   } else if (value.length < 8) {
                //     return 'Short Password';
                //   } else {
                //     return null;
                //   }
                // },
              ),
              const SizedBox(height: 25),
              PasswordTextField(
                passwordController: confirmPasswordController,
                hintText: ' Confirm Password',
                labelText: 'Password',
                // validator: (value) {
                //   if (value != passwordController.text) {
                //     return 'Confirmation is Not Valid';
                //   } else if (value!.isEmpty) {
                //     return 'Confirmation Required';
                //   } else {
                //     return null;
                //   }
                // },
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: SignButton(
                      title: 'Next',
                      onPressed: () async {
                        if (gKey.currentState!.validate()) {
                          UserData userData = UserData(
                            email: '',
                            password: '',
                          );
                          await Get.to(
                            () => EmailConfirm(userData: userData),
                            transition: Transition.rightToLeftWithFade,
                          );
                          // await EmailOTP.sendOTP(email: emailController.text);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
