import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 0.5, vertical: 0.5),
          height: 2,
          width: MediaQuery.of(context).size.width * 0.39,
          color: Colors.grey.shade300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Text(
            'OR',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade500,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          height: 2,
          width: MediaQuery.of(context).size.width * 0.39,
          color: Colors.grey.shade300,
        ),
      ],
    );
  }
}
