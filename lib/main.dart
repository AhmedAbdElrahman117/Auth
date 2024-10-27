import 'package:auth/Features/login/presentation/view/login_view.dart';
import 'package:auth/Features/login/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:auth/Features/signup/presentation/view_model/SignUpCubit/sign_up_cubit.dart';
import 'package:auth/constant.dart';
import 'package:auth/example_home.dart';
import 'package:auth/firebase_options.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();

  EmailOTP.config(
    appEmail: 'Auth@gmail.com',
    appName: 'Auth',
    emailTheme: EmailTheme.v5,
    otpLength: 5,
    otpType: OTPType.numeric,
  );

  runApp(const Auth());
}

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  late bool isLogged;
  @override
  void initState() {
    isLogged = box.read('isRemember') ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: /*isLogged ? const ExampleHome() :*/ const LoginView(),
      ),
    );
  }
}
