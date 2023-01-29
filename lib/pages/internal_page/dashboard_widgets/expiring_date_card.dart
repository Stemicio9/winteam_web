import 'package:flutter/material.dart';
import 'package:winteam_web/constants/colors.dart';
import 'package:winteam_web/constants/language.dart';
import 'package:winteam_web/pages/utils/utils.dart';

class ExpiringDateCard extends StatelessWidget{

  final String date;

  ExpiringDateCard({required this.date});

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
                getCurrentLanguageValue(EXPIRING)!,
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
            padding: EdgeInsets.all(21),
            child:Text(
              date,
              textAlign: TextAlign.center,
              style: SafeGoogleFont (
                'Montserrat',
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: background,
              ),
            ),
          )
        ],
      ),
    );
  }
  
}