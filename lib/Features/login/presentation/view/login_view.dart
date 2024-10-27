import 'package:auth/Features/login/presentation/view/widgets/custom_divider.dart';
import 'package:auth/Features/login/presentation/view/widgets/email_text_field.dart';
import 'package:auth/Features/login/presentation/view/widgets/login_button.dart';
import 'package:auth/Features/login/presentation/view/widgets/logo.dart';
import 'package:auth/Features/login/presentation/view/widgets/password_text_field.dart';
import 'package:auth/Features/login/presentation/view/widgets/sign_up_button.dart';
import 'package:auth/Features/login/presentation/view/widgets/sign_utils.dart';
import 'package:auth/Features/login/presentation/view/widgets/social_login.dart';
import 'package:auth/Features/login/presentation/view/widgets/welcome_text.dart';
import 'package:auth/Features/login/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:auth/Features/login/presentation/view_model/login_cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> gKey = GlobalKey();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          print('Logged In');
        } else if (state is LoginFailed) {
          Get.defaultDialog(
            title: 'Failed',
            middleText: state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading,
          child: Scaffold(
            body: SafeArea(
              child: Form(
                key: gKey,
                child: ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.02,
                    ),
                    const Logo(),
                    const WelcomeText(),
                    const SizedBox(
                      height: 15,
                    ),
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
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.035,
                    ),
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
                    const SizedBox(
                      height: 4,
                    ),
                    const SignUtils(),
                    LoginButton(
                      emailController: emailController,
                      passwordController: passwordController,
                      gKey: gKey,
                    ),
                    const CustomDivider(),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.025,
                    ),
                    const SocialLogin(),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Dont\'t Have An Account',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    const SignUpButton(),
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
