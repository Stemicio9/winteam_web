import 'package:flutter/material.dart';
import 'package:winteam_web/constants/colors.dart';


class InputsV2Widget extends StatelessWidget {
  final double round = 30.0;
  final String hinttext;
  TextEditingController controller;
  var validator;
  var onchanged;
  bool ispassword = false;
  bool autofocus;
  TextInputType keyboard;
  bool? enabled = true;
  final textInputAction;

  InputsV2Widget(
      {required hinttext,
      required controller,
      this.ispassword = false,
      validator = defaultValidator,
      this.onchanged = funzioneCostante,
      this.autofocus = false,
      this.keyboard = TextInputType.text,
      this.enabled,
      this.textInputAction = TextInputAction.next})
      : hinttext = hinttext,
        controller = controller,
        validator = validator;

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return TextFormField(
          //  validator: validator ?? defaultvalidator,
          style: const TextStyle(
            fontSize: 14,
          ),
          obscureText: ispassword,
          textInputAction: textInputAction,
          onChanged: onchanged,
          controller: controller,
          keyboardType: keyboard,
          onEditingComplete: () => node.nextFocus(),
          enabled: enabled,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(3.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(3.0),
            ),
            hintText: hinttext,
            hintStyle: const TextStyle(color: black, fontSize: 14, fontWeight: FontWeight.w500),
            filled: true,
            fillColor: white,
            floatingLabelBehavior: FloatingLabelBehavior.never
          ),
        );
  }
}

String defaultValidator(String text) {
  return "";
}

void funzioneCostante(String into) {}
