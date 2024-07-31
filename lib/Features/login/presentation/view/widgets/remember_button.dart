import 'package:auth/constant.dart';
import 'package:flutter/material.dart';

class RememberButton extends StatefulWidget {
  const RememberButton({super.key});

  @override
  State<RememberButton> createState() => _RememberButtonState();
}

class _RememberButtonState extends State<RememberButton> {
  bool? x = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: x,
          onChanged: (value) {
            setState(() {
              x = value;
            });
            box.write('isRemember', x);
          },
        ),
        const Text(
          'Remember me',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
