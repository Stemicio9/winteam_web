import 'package:flutter/material.dart';
import 'package:winteam_web/constants/colors.dart';
import 'package:winteam_web/constants/language.dart';
import 'package:winteam_web/widgets/texts_v2.dart';


class CheckboxV2Widget extends StatefulWidget {
  final String labeltext;

  CheckboxV2Widget({super.key, this.labeltext = ""});

  @override
  State<StatefulWidget> createState() => CheckboxV2WidgetState();
}

class CheckboxV2WidgetState extends State<CheckboxV2Widget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Row(
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              fillColor: MaterialStateProperty.all(white),
              checkColor: background,
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Texth4V2(testo: RICORDAMI, color: white)
          ],
        ));
  }
}
