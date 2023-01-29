import 'package:flutter/material.dart';
import 'package:winteam_web/constants/colors.dart';
import 'package:winteam_web/widgets/texts_v2.dart';

class ActionButtonV2 extends StatelessWidget {
  final double marginBottom;
  final double marginTop;
  final action;
  final String text;
  final Color color;
  final double maxWidth;
  final double maxHeight;
  final double fontSize;
  final double positionedRight;
  final double positionedLeft;
  final double positionedTop;
  final double positionedBottom;
  final TextAlign align;
  final double containerHeight;
  final Color textColor;
  final prefixIcon;
  final suffixIcon;
  final borderColor;
  final double borderWidth;
  final bool hasBorder;
  final FontWeight weight;
  final String imgPath;
  final String svgPath;
  final bool isVisible;
  final double iconWidth;
  final double iconHeight;

  ActionButtonV2(
      {this.marginBottom = 0,
        this.marginTop = 0,
        required this.action,
        required this.text,
        this.color = green,
        this.maxWidth = 220,
        this.maxHeight = 100,
        this.weight = FontWeight.w600,
        this.textColor = white,
        this.borderColor,
        this.borderWidth = 0.5,
        this.hasBorder = false,
        this.fontSize = 18,
        this.prefixIcon,
        this.suffixIcon,
        this.containerHeight = 50,
        this.positionedRight = 20,
        this.positionedLeft = 20,
        this.positionedTop = 0,
        this.positionedBottom = 0,
        this.align = TextAlign.center,
        this.isVisible = false,
        this.imgPath = '',
        this.svgPath = '',
        this.iconWidth = 10,
        this.iconHeight = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      margin: EdgeInsets.only(
          top: marginTop,
          bottom: marginBottom
      ),
      child: MaterialButton(
        elevation: 10,
        onPressed: () {
          action();
        },
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Ink(
            decoration: BoxDecoration(
              color: color,
              border: hasBorder
                  ? Border.all(color: borderColor, width: borderWidth)
                  : null,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Container(
              constraints:
              BoxConstraints(
                  maxWidth: maxWidth, maxHeight: maxHeight),
              alignment: Alignment.center,
              child: IntrinsicHeight(
                child: Texth2V2(
                  testo: text,
                  color: textColor,
                  weight: FontWeight.w700,
                )

              ),
            )),
      ),
    );
  }
}
