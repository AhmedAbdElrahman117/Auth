import 'package:auth/Features/login/presentation/view/widgets/logo.dart';
import 'package:auth/Features/login/presentation/view/widgets/sign_button.dart';
import 'package:auth/Features/signup/data/user_data.dart';
import 'package:auth/Features/signup/presentation/view/widgets/age.dart';
import 'package:auth/Features/signup/presentation/view/widgets/date_of_birth.dart';
import 'package:auth/Features/signup/presentation/view/widgets/user_name.dart';
import 'package:auth/Features/signup/presentation/view_model/SignUpCubit/sign_up_cubit.dart';
import 'package:auth/Features/signup/presentation/view_model/sign_up_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
    super.key,
    required this.userData,
  });

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> pKey = GlobalKey();
    TextEditingController userNameController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController ageController = TextEditingController();

    return BlocBuilder<SignUpCubit, SignUpStates>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading,
          progressIndicator: const CircularProgressIndicator(
            color: Colors.black,
          ),
          child: Scaffold(
            body: SafeArea(
              child: Form(
                key: pKey,
                child: ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.16,
                    ),
                    const Logo(),
                    const Text(
                      'Personal Information',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    UserName(
                      userNameController: userNameController,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DateOfBirth(
                            dateController: dateController,
                            userData: userData,
                          ),
                        ),
                        Expanded(
                          child: Age(
                            ageController: ageController,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SignButton(
                            title: 'Sign Up',
                            onPressed: () async {
                              if (pKey.currentState!.validate()) {
                                userData.name = userNameController.text;
                                userData.age = int.parse(ageController.text);
                                BlocProvider.of<SignUpCubit>(context).signUp(
                                  userData: userData,
                                );
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
