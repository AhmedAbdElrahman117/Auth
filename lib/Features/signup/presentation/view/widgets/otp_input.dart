import 'package:auth/Features/signup/data/user_data.dart';
import 'package:auth/Features/signup/presentation/view/widgets/personal_info.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OTPInput extends StatefulWidget {
  const OTPInput({
    super.key,
    required this.userData,
  });

  final UserData userData;

  @override
  State<OTPInput> createState() => _OTPInputState();
}

class _OTPInputState extends State<OTPInput> {
  bool error = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 16),
      child: Pinput(
        length: 5,
        mainAxisAlignment: MainAxisAlignment.center,
        // pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        pinAnimationType: PinAnimationType.slide,
        defaultPinTheme: otpTheme(),
        onCompleted: (value) async {
          if (EmailOTP.verifyOTP(otp: value)) {
            await Get.to(
              () => PersonalInfo(userData: widget.userData),
              transition: Transition.rightToLeftWithFade,
            );
          } else {
            setState(() {
              error = true;
            });
          }
        },
        errorText: 'OTP is Incorrect',
        forceErrorState: error,
      ),
    );
  }

  PinTheme otpTheme() {
    return PinTheme(
      textStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 60,
      width: 60,
    );
  }
}
