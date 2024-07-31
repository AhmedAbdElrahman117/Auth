// ignore_for_file: unused_local_variable

import 'package:auth/Features/login/presentation/view/widgets/custom_text_form_field.dart';
import 'package:auth/Features/login/presentation/view/widgets/logo.dart';
import 'package:auth/Features/login/presentation/view/widgets/sign_button.dart';
import 'package:auth/Features/signup/presentation/view/email_confirm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterInfo extends StatelessWidget {
  const RegisterInfo({super.key});

  @override
  Widget build(BuildContext context) {
    String email = '';
    String pass = '';
    String passconfirm = '';
    GlobalKey<FormState> gKey = GlobalKey();
    return Form(
      key: gKey,
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.16,
          ),
          const Logo(),
          const Text(
            'Register Information',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextFormField(
            hintText: 'Enter your Email',
            labelText: 'Email Address',
            onChanged: (value) {
              email = value;
            },
            // validator: (value) {
            //   if (value!.isEmpty) {
            //     return 'Email Required';
            //   } else {
            //     return null;
            //   }
            // },
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextFormField(
            hintText: ' Enter you Password',
            labelText: 'Password',
            onChanged: (value) {
              pass = value;
            },
            passwordControll: true,
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
          const SizedBox(
            height: 25,
          ),
          CustomTextFormField(
            hintText: ' Confirm Password',
            labelText: 'Password',
            onChanged: (value) {
              passconfirm = value;
            },
            passwordControll: true,
            // validator: (value) {
            //   if (value != pass) {
            //     return 'Confirmation is Not Valid';
            //   } else if (value!.isEmpty) {
            //     return 'Confirmation Required';
            //   } else {
            //     return null;
            //   }
            // },
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Expanded(
                child: SignButton(
                  title: 'Next',
                  onPressed: () async {
                    if (gKey.currentState!.validate()) {
                      var x = ActionCodeSettings(
                        url: 'https://authappahmed.page.link/emailauthlogin',
                        handleCodeInApp: true,
                      );
                      await FirebaseAuth.instance.sendSignInLinkToEmail(
                        email: email,
                        actionCodeSettings: x,
                      );
                      Get.to(
                        () => const EmailConfirm(),
                        transition: Transition.rightToLeftWithFade,
                        arguments: [email, pass],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
