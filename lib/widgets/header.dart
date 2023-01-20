import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final Widget title;
  final double verticalPadding;

  const HeaderWidget({Key? key, required this.title, this.verticalPadding = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              title
            ]
        ),
      ),
    );
  }
}
