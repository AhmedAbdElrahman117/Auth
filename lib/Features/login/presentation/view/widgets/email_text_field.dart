import 'package:auth/Features/signup/presentation/view/widgets/otp_input.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField(
      {super.key,
      required this.hintText,
      required this.labelText,
      this.validator,
      required this.emailController,
      this.onTap,
      this.canRequestFocus = true,
      this.onChanged,
      this.keyboardType});

  final String hintText;
  final String labelText;
  final String? Function(String? value)? validator;
  final TextEditingController emailController;
  final void Function()? onTap;
  final bool? canRequestFocus;
  final void Function(String value)? onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: emailController,
        validator: validator,
        onTap: onTap,
        onChanged: onChanged,
        keyboardType: keyboardType,
        canRequestFocus: canRequestFocus!,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
        ),
      ),
    );
  }
}
