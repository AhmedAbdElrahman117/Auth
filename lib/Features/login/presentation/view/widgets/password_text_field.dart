import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField(
      {super.key,
      required this.hintText,
      required this.labelText,
      this.validator,
      required this.passwordController});

  final String hintText;
  final String labelText;
  final String? Function(String? value)? validator;
  final TextEditingController passwordController;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obsecure = true;
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        setState(() {
          isFocused = value;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          controller: widget.passwordController,
          validator: widget.validator,
          obscureText: obsecure,
          decoration: InputDecoration(
            hintText: widget.hintText,
            labelText: widget.labelText,
            labelStyle: const TextStyle(
              color: Colors.black,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffix: isFocused
                ? InkWell(
                    onTap: () {
                      if (obsecure) {
                        obsecure = false;
                      } else {
                        obsecure = true;
                      }
                      setState(() {});
                    },
                    child: Icon(
                      obsecure ? Icons.visibility : Icons.visibility_off,
                      size: 27,
                    ),
                  )
                : null,
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
      ),
    );
  }
}
