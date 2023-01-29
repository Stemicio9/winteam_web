import 'package:flutter/material.dart';
import 'package:winteam_web/constants/colors.dart';
import 'package:winteam_web/constants/language.dart';
import 'package:winteam_web/pages/utils/utils.dart';

class FeaturesCard extends StatelessWidget {
  List<String> featuresList;

  FeaturesCard({required this.featuresList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Card(
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
                  getCurrentLanguageValue(AVAILABLE_FEATURES)!,
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
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: featuresList.map(
                        (e) => Padding(
                      padding: const EdgeInsets.only(top: 9.0,bottom: 9.0),
                      child: Text(
                        '\u2022 $e',
                        style: SafeGoogleFont(
                            'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: black
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
