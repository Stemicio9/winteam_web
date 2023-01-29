

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:winteam_web/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam_web/constants/colors.dart';
import 'package:winteam_web/constants/route_constants.dart';
import 'package:winteam_web/pages/background/GradientBackground.dart';
import 'package:winteam_web/widgets/utilities/close_on_tap.dart';


class W1NScaffold extends StatelessWidget {

  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? title;
  final bool showAppBar;
  final UserCubit? userCubit;


  const W1NScaffold({Key? key, required this.body, this.bottomNavigationBar, this.title, this.showAppBar = false,  this.userCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(showAppBar,context),
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

  PreferredSizeWidget? appBar(bool showAppBar, context) {
    return showAppBar ? AppBar(
        backgroundColor: background,
        title: GestureDetector(
          onTap: (){Navigator.pushNamed(context, RouteConstants.dashboard);},
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
                child: title
            )
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: IconButton(
                onPressed: () {
                  logoutFromAll();
                  Navigator.pushReplacementNamed(context, RouteConstants.login);
                },
                icon: const Icon(Icons.logout)
            ),
          )
        ]
    ) : null;
  }



  void logoutFromAll() {
    FirebaseAuth.instance.signOut();
    userCubit?.logout();

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


