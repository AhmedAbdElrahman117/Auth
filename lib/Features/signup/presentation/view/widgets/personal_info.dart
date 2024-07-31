import 'package:auth/Features/login/presentation/view/widgets/custom_text_form_field.dart';
import 'package:auth/Features/login/presentation/view/widgets/logo.dart';
import 'package:auth/Features/login/presentation/view/widgets/sign_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfo extends StatefulWidget {
  PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  late GlobalKey<FormState> pKey = GlobalKey();
  late String name;
  late String dateOfBirth;
  late String age;

  @override
  Widget build(BuildContext context) {
    var authData = Get.arguments;

    return Scaffold(
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
              CustomTextFormField(
                hintText: 'Enter your Full Name',
                labelText: 'Full Name',
                onChanged: (value) {
                  name = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name Required';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextFormField(
                hintText: 'Enter your Date of Birth',
                labelText: 'Date of Birth',
                onChanged: (value) {
                  dateOfBirth = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Date Required';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextFormField(
                hintText: 'Enter your Age',
                labelText: 'Age',
                onChanged: (value) {
                  age = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Age Required';
                  } else {
                    return null;
                  }
                },
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
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: authData[0],
                            password: authData[1],
                          );
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(authData[0])
                              .set({
                            'name': name,
                            'age': age,
                            'date of birth': dateOfBirth,
                          });
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
