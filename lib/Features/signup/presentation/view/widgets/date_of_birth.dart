import 'package:auth/Features/login/presentation/view/widgets/email_text_field.dart';
import 'package:auth/Features/signup/data/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class DateOfBirth extends StatelessWidget {
  const DateOfBirth({
    super.key,
    required this.dateController,
    required this.userData,
  });

  final TextEditingController dateController;
  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return EmailTextField(
      emailController: dateController,
      hintText: 'your Date of Birth',
      labelText: 'Date of Birth',
      canRequestFocus: false,
      onTap: () async {
        var getDate = await showDatePicker(
          context: context,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        );

        if (getDate != null) {
          userData.date = Timestamp.fromDate(getDate);
          dateController
              .setText('${getDate.year}-${getDate.month}-${getDate.day}');
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Date Required';
        } else {
          return null;
        }
      },
    );
  }
}
