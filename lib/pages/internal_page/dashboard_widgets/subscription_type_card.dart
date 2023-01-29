import 'package:flutter/material.dart';
import 'package:winteam_web/constants/colors.dart';
import 'package:winteam_web/constants/language.dart';
import 'package:winteam_web/pages/utils/utils.dart';
import 'package:winteam_web/widgets/action_buttons_v2.dart';

class SubscriptionTypeCard extends StatelessWidget {
  final String subscriptionType;
  final onTap;

  SubscriptionTypeCard({required this.subscriptionType, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      child: Column(
        children: [
          Container(
            width: 300,
            padding: const EdgeInsets.symmetric(vertical: 30),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: background),
            child: Center(
              child: Text(
                getCurrentLanguageValue(SUBSCRIPTION_TYPE_TITLE)!,
                textAlign: TextAlign.center,
                style: SafeGoogleFont('Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: white),
              ),
            ),
          ),
          Container(
              width: 300,
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  Text(
                    subscriptionType,
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                        'Montserrat',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: background
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: ActionButtonV2(
                      action: onTap,
                      text: getCurrentLanguageValue(EDIT)!,
                    ),
                  )


                ],
              ))
        ],
      ),
    );
  }
}
