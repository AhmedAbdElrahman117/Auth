import 'package:auth/Features/login/presentation/view/widgets/custom_text_form_field.dart';
import 'package:auth/Features/login/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Enter your Email',
      labelText: 'Email Address',
      onChanged: (value) {
        BlocProvider.of<LoginCubit>(context).email = value;
        BlocProvider.of<LoginCubit>(context).loginProgress();
      },
      onFieldSubmitted: (value) {
        BlocProvider.of<LoginCubit>(context).email = value;
        BlocProvider.of<LoginCubit>(context).loginProgress();
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email Required';
        } else {
          return null;
        }
      },
    );
  }
}
