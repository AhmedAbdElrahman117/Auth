import 'package:auth/Features/login/presentation/view/widgets/email_text_field.dart';
import 'package:flutter/material.dart';

class Age extends StatelessWidget {
  const Age({
    super.key,
    required this.ageController,
  });

  final TextEditingController ageController;

  @override
  Widget build(BuildContext context) {
    return EmailTextField(
      emailController: ageController,
      hintText: 'your Age',
      labelText: 'Age',
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Age Required';
        } else {
          return null;
        }
      },
    );
  }
}
