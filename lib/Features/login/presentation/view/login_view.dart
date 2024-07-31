import 'package:auth/Features/login/presentation/view/widgets/custom_divider.dart';
import 'package:auth/Features/login/presentation/view/widgets/email_text_field.dart';
import 'package:auth/Features/login/presentation/view/widgets/facebook_login_button.dart';
import 'package:auth/Features/login/presentation/view/widgets/google_login_button.dart';
import 'package:auth/Features/login/presentation/view/widgets/login_button.dart';
import 'package:auth/Features/login/presentation/view/widgets/logo.dart';
import 'package:auth/Features/login/presentation/view/widgets/password_text_field.dart';
import 'package:auth/Features/login/presentation/view/widgets/sign_up_button.dart';
import 'package:auth/Features/login/presentation/view/widgets/sign_utils.dart';
import 'package:auth/Features/login/presentation/view/widgets/twitter_login_button.dart';
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
          inAsyncCall: BlocProvider.of<LoginCubit>(context).isLoading,
          child: Scaffold(
            body: SafeArea(
              child: Form(
                key: gKey,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Logo(),
                    const WelcomeText(),
                    const SizedBox(
                      height: 15,
                    ),
                    const EmailTextField(),
                    const SizedBox(
                      height: 20,
                    ),
                    const PasswordTextField(),
                    const SizedBox(
                      height: 4,
                    ),
                    const SignUtils(),
                    LoginButton(
                      email: BlocProvider.of<LoginCubit>(context).email,
                      pass: BlocProvider.of<LoginCubit>(context).pass,
                      gKey: gKey,
                    ),
                    const CustomDivider(),
                    const SizedBox(
                      height: 20,
                    ),
                    const GoogleLoginButton(),
                    const SizedBox(
                      height: 15,
                    ),
                    const FacebookLoginButton(),
                    const SizedBox(
                      height: 15,
                    ),
                    const TwitterLoginButton(),
                    const SizedBox(
                      height: 10,
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
