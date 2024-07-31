import 'package:auth/Features/login/presentation/view/widgets/custom_text_form_field.dart';
import 'package:auth/Features/login/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: ' Enter you Password',
      labelText: 'Password',
      onChanged: (value) {
        BlocProvider.of<LoginCubit>(context).pass = value;
        BlocProvider.of<LoginCubit>(context).loginProgress();
      },
      onFieldSubmitted: (value) {
        BlocProvider.of<LoginCubit>(context).pass = value;
        BlocProvider.of<LoginCubit>(context).loginProgress();
      },
      passwordControll: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password Required';
        } else if (value.length < 8) {
          return 'Short Password';
        } else {
          return null;
        }
      },
    );
  }
}
