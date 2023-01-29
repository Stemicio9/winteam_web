import 'package:flutter/material.dart';
import 'package:winteam_web/constants/colors.dart';
import 'package:winteam_web/pages/utils/utils.dart';

class BankTransferForm extends StatelessWidget {
  final String price;
  final String purpose;


  BankTransferForm({required this.price, required this.purpose});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(bottom: 20),
          child: RichText(
            text: TextSpan(
              text: 'Intestato a: ',
              style: SafeGoogleFont(
                'Montserrat',
                fontWeight: FontWeight.normal,
                color: black,
                fontSize: 14,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Work One Night di Gilda De Marco',
                  style: SafeGoogleFont(
                    'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,

          padding: EdgeInsets.only(bottom: 20),
          child: RichText(
            text: TextSpan(
              text: 'IBAN: ',
              style: SafeGoogleFont(
                'Montserrat',
                fontWeight: FontWeight.normal,
                color: black,
                fontSize: 14,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'IT67R0542416201000001010807',
                  style: SafeGoogleFont(
                    'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(bottom: 20),
          child: RichText(
            text: TextSpan(
              text: 'Importo: ',
              style: SafeGoogleFont(
                'Montserrat',
                fontWeight: FontWeight.normal,
                color: black,
                fontSize: 14,
                ),
              children: <TextSpan>[
                TextSpan(
                  text:'€ $price',
                  style: SafeGoogleFont(
                    'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),


        Container(
          width: MediaQuery.of(context).size.width,
          child: RichText(
            text: TextSpan(
              text: 'Causale: ',
              style: SafeGoogleFont(
                'Montserrat',
                fontWeight: FontWeight.normal,
                color: black,
                fontSize: 14,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Abbonamento W1N $purpose',
                  style: SafeGoogleFont(
                    'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
