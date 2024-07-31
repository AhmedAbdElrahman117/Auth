import 'package:auth/Features/login/presentation/view/widgets/logo.dart';
import 'package:auth/Features/login/presentation/view/widgets/sign_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailConfirm extends StatelessWidget {
  const EmailConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Logo(),
            const Text(
              'Email Confirmation',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'An Email with Verification Link Was Sent To Your Email\nCheck Your Email Inbox',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: SignButton(
                    title: 'Open Gmail',
                    onPressed: () async {
                      await launchUrl(
                        Uri.parse(
                          'https://mail.google.com/mail/u/0/#inbox',
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  launchURL(Uri link) async {
    await launchUrl(
      link,
      mode: LaunchMode.platformDefault,
    );
  }
}
