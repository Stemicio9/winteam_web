

import 'package:flutter/material.dart';
import 'package:winteam_web/constants/colors.dart';
import 'package:winteam_web/pages/background/GradientBackground.dart';
import 'package:winteam_web/widgets/utilities/close_on_tap.dart';
import 'background/background.dart';


class W1NScaffold extends StatelessWidget {

  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? title;
  final bool showAppBar;

  const W1NScaffold({Key? key, required this.body, this.bottomNavigationBar, this.title, this.showAppBar = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(showAppBar),
      resizeToAvoidBottomInset: false,
      body: CloseOnTapUtility(child: Stack(
        children: [
          const GradientBackground(),
          body
        ],
      )),
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  PreferredSizeWidget? appBar(bool showAppBar) {
    return showAppBar ? AppBar(
        backgroundColor: background,
        title: title,
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logout)
          )
        ]
    ) : null;
  }
}


class W1NScaffoldWithBackground extends StatelessWidget {

  final Widget body;

  const W1NScaffoldWithBackground({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CloseOnTapUtility(
          child: Stack(
            children: [
              const GradientBackground(),
              body
            ],
          )
      ),
    );
  }
}