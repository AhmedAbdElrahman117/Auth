// ignore_for_file: use_build_context_synchronously

import 'package:auth/Features/login/presentation/view/login_view.dart';
import 'package:auth/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ExampleHome extends StatelessWidget {
  const ExampleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut().then(
              (value) {
                box.write('isRemember', false);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginView();
                    },
                  ),
                );
              },
            );
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
