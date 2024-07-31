// ignore_for_file: body_might_complete_normally_nullable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.labelText,
      this.onChanged,
      this.passwordControll = false,
      this.validator,
      this.onFieldSubmitted});

  final String hintText;
  final String labelText;
  final void Function(String)? onChanged;
  final String? Function(String? value)? validator;
  final void Function(String value)? onFieldSubmitted;
  bool passwordControll;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: widget.validator,
        obscureText:
            widget.passwordControll ? obsecure == true : obsecure == false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffix: widget.passwordControll
              ? GestureDetector(
                  onTap: () {
                    if (obsecure) {
                      obsecure = false;
                    } else {
                      obsecure = true;
                    }
                    setState(() {});
                  },
                  child: const Icon(
                    FontAwesomeIcons.solidEye,
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
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}
