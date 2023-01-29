import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam_web/authentication/firebase_repository.dart';
import 'package:winteam_web/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam_web/blocs/user_bloc/user_list_cubit.dart';
import 'package:winteam_web/constants/colors.dart';
import 'package:winteam_web/constants/language.dart';
import 'package:winteam_web/constants/route_constants.dart';
import 'package:winteam_web/model/user_entity.dart';
import 'package:winteam_web/widgets/action_buttons_v2.dart';
import 'package:winteam_web/widgets/checkbox_v2.dart';
import 'package:winteam_web/widgets/inputs_v2.dart';
import 'package:winteam_web/widgets/texts_v2.dart';
import 'package:winteam_web/widgets/utilities/image_utility.dart';

class ForgotPasswordForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ForgotPasswordFormState();
  }
}

class ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final double logoWidth = 250;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(flex: 2, child: logoSection()),
              Expanded(flex: 1, child: forgotPassTextSection()),
              Expanded(flex: 2, child: forgotPassInputSection()),
              Expanded(flex: 2, child: backButtonSection())
            ],
          )),
    );
  }

  Widget logoSection() {
    return Container(
      width: logoWidth,
      child: const ImagePlaceholder(
        name: LOGO_IMAGE_NAME,
      ),
    );
  }

  Widget forgotPassTextSection() {
    return Texth1V2(
        testo: getCurrentLanguageValue(PASSWORD_RECOVERY)!,
        color: white,
        weight: FontWeight.w700,
        fontsize: 24);
  }

  Widget forgotPassInputSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InputsV2Widget(
            hinttext: EMAIL,
            controller: _emailTextController,
          ),
          ActionButtonV2(
              action: () {}, text: getCurrentLanguageValue(CONFIRM)!),
        ],
      ),
    );
  }

  Widget backButtonSection() {

    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child:  Texth4V2(
                  testo: getCurrentLanguageValue(BACK)!,
                  color: white,
                  weight: FontWeight.w700,
                  underline: true,
                ),
              ),
            )
          ),
          Expanded(
            flex: 4,
            child: Container(),
          )
        ],
      ),
    );


  }
}
