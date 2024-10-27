import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.icon, required this.text, this.onPressed});

  final String icon;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          Colors.grey.shade100,
        ),
      ),
      icon: Image.asset(
        icon,
        scale: 1.5,
      ),
    );
  }
}


// Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: TextButton.icon(
//         onPressed: onPressed,
//         label: Text(
//           text,
//           style: const TextStyle(
//             fontSize: 20,
//             color: Colors.black,
//           ),
//         ),
//         style: TextButton.styleFrom(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//             side: BorderSide(
//               color: Colors.grey.shade600,
//             ),
//           ),
//         ),
        // icon: Image.asset(
        //   icon,
        //   scale: 2,
        // ),
//         iconAlignment: IconAlignment.end,
//       ),
//     );
