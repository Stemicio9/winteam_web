import 'package:flutter/material.dart';
import 'package:winteam_web/pages/W1n_scaffold.dart';
import 'package:winteam_web/pages/background/background.dart';
import 'package:winteam_web/pages/forgot_password/forgot_password_form.dart';
import 'package:winteam_web/pages/login/login_form_v2.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {

  final double cardWidth = 400;
  final double cardHeight = 700;

  @override
  Widget build(BuildContext context) {
    return W1NScaffoldWithBackground(
        body: Center(
          child: SizedBox(
            width: cardWidth,
            height: cardHeight,
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    const BackgroundV2(),
                    ForgotPasswordForm(),
                  ],
                )
            ),
          ),
        )
    );
  }
}
