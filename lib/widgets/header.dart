import 'package:flutter/material.dart';
import 'package:winteam_web/constants/colors.dart';
import 'package:winteam_web/pages/utils/utils.dart';

class HeaderWidget extends StatelessWidget {
  final String pageTitle;
  final String name;
  final bool isVisible;
  final double verticalPadding;
  final double horizontalPadding;

  const HeaderWidget(
      {Key? key,
      required this.pageTitle,
      this.verticalPadding = 20,
      this.horizontalPadding = 20,
      this.name = '',
      this.isVisible = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 1284;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return LayoutBuilder(builder: (context, constraints) {
      var fontsizeName = 32 * ffem;
      var fontsizeTitle = 24 * ffem;
      if (constraints.maxWidth > 600) {
      } else {
        fontsizeName = 60 * ffem;
        fontsizeTitle = 55 * ffem;
      }
      return Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding, horizontal: horizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: isVisible,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(name,
                            style: SafeGoogleFont(
                              'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: background,
                              fontSize: fontsizeName,
                            )),
                      ),
                    ),
                    Text(pageTitle,
                        style: SafeGoogleFont(
                          'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: background,
                          fontSize: fontsizeTitle,
                        )),
                  ]),
            ],
          ),
        ),
      );
    });
  }
}
