import 'package:auth/Features/login/presentation/view/widgets/email_text_field.dart';
import 'package:auth/Features/login/presentation/view/widgets/logo.dart';
import 'package:auth/Features/login/presentation/view/widgets/password_text_field.dart';
import 'package:auth/Features/login/presentation/view/widgets/sign_button.dart';
import 'package:auth/Features/signup/data/user_data.dart';
import 'package:auth/Features/signup/presentation/view_model/SignUpCubit/sign_up_cubit.dart';
import 'package:auth/Features/signup/presentation/view_model/sign_up_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> gKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpStates>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is CheckUserLoading,
          child: Scaffold(
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email Required';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 25),
                    PasswordTextField(
                      passwordController: passwordController,
                      hintText: ' Enter you Password',
                      labelText: 'Password',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password Required';
                        } else if (value.length < 8) {
                          return 'Short Password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 25),
                    PasswordTextField(
                      passwordController: confirmPasswordController,
                      hintText: ' Confirm Password',
                      labelText: 'Confirm Password',
                      validator: (value) {
                        if (value != passwordController.text) {
                          return 'Confirmation is Not Valid';
                        } else if (value!.isEmpty) {
                          return 'Confirmation Required';
                        } else {
                          return null;
                        }
                      },
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
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                                BlocProvider.of<SignUpCubit>(context)
                                    .checkUser(userData);
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
          ),
        );
      },
    );
  }
}
