import 'package:auth/Features/login/presentation/view_model/login_cubit/login_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  void loginProgress() {
    emit(LoginInProgress());
  }

  void loginWithEmail({required String email, required String pass}) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailed(e.code.toString()));
    }
  }

  void googleLogin() async {
    emit(LoginLoading());
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    if (googleAuth == null) {
      emit(LoginFailed('Login Request Failed\n Try Again Later'));
    } else {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(LoginSuccess());
    }
  }

  void loginWithFacebook() async {
    emit(LoginLoading());
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.accessToken == null) {
      emit(LoginFailed('Login Request Failed\n Try Again Later'));
    } else {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      emit(LoginSuccess());
    }
  }

  void twitterLogin() async {
    emit(LoginLoading());
    final twitterLogin = TwitterLogin(
      apiKey: 'pebS9UvK3fwhA0suG52NgYsAF',
      apiSecretKey: '20rWxXCbS1xOEOdcR1Uri1xJDh5D8JglcqynTDBLqf1ZdgfvCb',
      redirectURI: 'authapp2003://',
    );
    final authResult = await twitterLogin.login();

    if (authResult.authToken == null || authResult.authTokenSecret == null) {
      emit(LoginFailed('Login Request Failed\n Try Again Later'));
    } else {
      final OAuthCredential twitterCredential = TwitterAuthProvider.credential(
        accessToken: authResult.authToken.toString(),
        secret: authResult.authTokenSecret.toString(),
      );
      await FirebaseAuth.instance.signInWithCredential(twitterCredential);
      emit(LoginSuccess());
    }
  }
}
