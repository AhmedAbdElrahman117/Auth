import 'package:auth/Features/login/presentation/view/widgets/email_text_field.dart';
import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  const UserName({
    super.key,
    required this.userNameController,
  });

  final TextEditingController userNameController;

  @override
  Widget build(BuildContext context) {
    return EmailTextField(
      emailController: userNameController,
      hintText: 'Enter your Full Name',
      labelText: 'Full Name',
      validator: (value) {
        if (value!.isEmpty) {
          return 'Name Required';
        } else {
          return null;
        }
      },
    );
  }
}
