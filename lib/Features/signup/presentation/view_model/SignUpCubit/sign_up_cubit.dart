import 'package:auth/Features/signup/data/user_data.dart';
import 'package:auth/Features/signup/presentation/view/email_confirm.dart';
import 'package:auth/Features/signup/presentation/view_model/sign_up_states.dart';
import 'package:auth/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpinitState());

  void signUp({required UserData userData}) async {
    emit(SignUpLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userData.email,
        password: userData.password,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userData.email)
          .set(
        {
          'name': userData.userName,
          'age': userData.userAge,
          'date of birth': userData.dateOfBirth,
          'email': userData.email,
        },
      );
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailed(errorMessage: e.toString()));
    }
  }

  void checkUser(UserData userData) async {
    emit(CheckUserLoading());

    var x = await FirebaseFirestore.instance
        .collection('users')
        .doc(userData.email)
        .get();
    if (x.exists) {
      emit(CheckUserEnd());
      Get.defaultDialog(
        title: 'Sign Up Failed',
        middleText: 'Email Address Already Used',
      );
    } else {
      await EmailOTP.sendOTP(email: userData.email);
      await Get.to(
        () => EmailConfirm(userData: userData),
        transition: kTrans,
      );
      emit(CheckUserEnd());
    }
  }
}
