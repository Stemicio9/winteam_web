

import 'package:flutter/material.dart';
import 'package:winteam_web/widgets/utilities/close_on_tap.dart';
import 'background/background.dart';


class W1NScaffold extends StatelessWidget {

  final Widget body;
  final Widget? bottomNavigationBar;

  const W1NScaffold({Key? key, required this.body, this.bottomNavigationBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CloseOnTapUtility(child: body),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}


class W1NScaffoldWithBackground extends StatelessWidget {

  final Widget body;

  const W1NScaffoldWithBackground({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: CloseOnTapUtility(
          child: Stack(
            children: [
              BackgroundV2(),

              body
            ],
          )
      ),
    );
  }
}