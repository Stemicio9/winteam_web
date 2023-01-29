import 'package:flutter/material.dart';
import 'package:winteam_web/constants/colors.dart';
import 'package:winteam_web/constants/language.dart';
import 'package:winteam_web/pages/utils/utils.dart';
import 'package:winteam_web/widgets/action_buttons_v2.dart';

class EmployeesSearchCard extends StatelessWidget{

  final onTap;

  EmployeesSearchCard({required this.onTap});

  @override
  Widget build(BuildContext context) {

    return  Card(
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
                getCurrentLanguageValue(EMPLOYEES_SEARCH)!,
                textAlign: TextAlign.center,
                style: SafeGoogleFont('Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: white
                ),
              ),
            ),
          ),
          Container(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15,top: 15,left: 40,right: 40),
              child: ActionButtonV2(
                action: onTap,
                text: ENABLED,
                color: greyDisabled,
                textColor: black,
              ),
            ),
          ),
        ],
      ),
    );





  }
}