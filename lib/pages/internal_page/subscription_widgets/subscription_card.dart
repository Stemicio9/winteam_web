import 'package:flutter/material.dart';
import 'package:winteam_web/constants/colors.dart';
import 'package:winteam_web/pages/utils/utils.dart';
import 'package:winteam_web/widgets/action_buttons_v2.dart';

class SubscriptionCard extends StatelessWidget {
  final String cardTitle;
  final String price;
  final onTap;
  final String text;
  final String actualText;
  List<String> featuresList;
  final bool isVisible;
  final bool isActive;
  final double padding;

  SubscriptionCard({
    required this.cardTitle,
    required this.price,
    required this.onTap,
    required this.text,
    this.actualText = '',
    required this.featuresList,
    this.padding = 50,
    this.isVisible = true,
    this.isActive = false
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 1284;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        child: Column(children: [
          Container(
            width: 300,
            padding: const EdgeInsets.symmetric(vertical: 30),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: background),
            child: Text(
              cardTitle,
              textAlign: TextAlign.center,
              style: SafeGoogleFont(
                'Montserrat',
                fontWeight: FontWeight.bold,
                color: white,
                fontSize: 28,
              ),
            ),
          ),
          Container(
            width: 300,
            padding: EdgeInsets.all(padding),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Text(
                    '€ $price',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: background,
                      fontSize: 45,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: featuresList
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(top: 6, bottom: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '\u2022 $e',
                                style: SafeGoogleFont('Montserrat',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: black),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
                Visibility(
                  visible: isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: isActive ?

                    ActionButtonV2(
                      action: (){},
                      text: actualText,
                      color: greyDisabled,
                      textColor: black,
                    ) :
                    ActionButtonV2(
                      action: onTap,
                      text: text,
                    ),
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
