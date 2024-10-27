import 'package:auth/Features/signup/data/user_data.dart';
import 'package:auth/Features/signup/presentation/view_model/sign_up_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        },
      );
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailed(errorMessage: ''));
    }
  }
}
