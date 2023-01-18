import 'package:flutter/material.dart';
import 'package:winteam_web/constants/colors.dart';
import 'package:winteam_web/widgets/texts_v2.dart';

Widget ActionButtonV2(String text, Function action) {
  return Container(
    height: 50.0,
    child: MaterialButton(
      elevation: 10,
      onPressed: () {
        action();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      child: Ink(
        decoration: BoxDecoration(
            color: green, borderRadius: BorderRadius.circular(30.0)),
        child: Container(
            alignment: Alignment.center,
            child: Texth2V2(
              testo: text,
              color: white,
              weight: FontWeight.w600,
            )),
      ),
    ),
  );
}
