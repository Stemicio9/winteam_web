import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:winteam_web/constants/colors.dart';
import 'package:winteam_web/constants/language.dart';
import 'package:winteam_web/constants/route_constants.dart';
import 'package:winteam_web/pages/internal_page/payment_widgets/bank_transfer_form.dart';
import 'package:winteam_web/pages/internal_page/payment_widgets/credit_card_form.dart';
import 'package:winteam_web/pages/utils/utils.dart';
import 'package:winteam_web/widgets/action_buttons_v2.dart';
import 'package:winteam_web/widgets/texts_v2.dart';

class PaymentForm extends StatelessWidget {
  final radioButton1;
  final radioButton2;
  final onTap;
  final sendBankTransfer;
  final alignment;
  final String image1;
  final String image2;
  final double paddingCard;
  final double paddingBetweenInput;
  final double paddingBetweenCardSection;
  final double titleFontSize;
  final double paymentFontSize;
  final double paymentMethodSize;
  final double paddingBottom;
  final double iconWidth;
  final double iconHeight;
  final double paddingTop;
  final String price;
  final String purpose;

  final TextEditingController nameCardController;
  final TextEditingController numberCardController;
  final TextEditingController cvvController;
  final TextEditingController expiryDateController;

  final bool isCreditCard;
  final dynamic nameCardValidator;
  final dynamic numberCardValidator;
  final dynamic cvvValidator;
  final dynamic expiryDateValidator;

  PaymentForm(
      {required this.radioButton1,
      required this.radioButton2,
      required this.price,
      required this.purpose,
      required this.image1,
      required this.paddingTop,
      required this.paddingBottom,
      required this.image2,
      required this.paddingCard,
      required this.paddingBetweenInput,
      required this.paddingBetweenCardSection,
      required this.alignment,
      required this.iconWidth,
      required this.iconHeight,
      required this.paymentMethodSize,
      this.titleFontSize = 32,
      this.paymentFontSize = 18,
      required this.cvvController,
      required this.expiryDateController,
      required this.nameCardController,
      required this.numberCardController,
      this.expiryDateValidator,
      this.cvvValidator,
      required this.isCreditCard,
      required this.onTap,
      required this.sendBankTransfer,
      this.nameCardValidator,
      this.numberCardValidator});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Padding(
          padding: EdgeInsets.all(paddingCard),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: paddingBetweenCardSection),
                child: Text(getCurrentLanguageValue(PAYMENT_TITLE)!,
                    style: SafeGoogleFont(
                      'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: background,
                      fontSize: titleFontSize,
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: paddingBetweenCardSection),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: paddingBottom),
                      child: Text(
                        getCurrentLanguageValue(PAYMENT_METHOD)!,
                        style: SafeGoogleFont(
                          'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: black,
                          fontSize: paymentFontSize,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: paddingBottom),
                      child: Row(
                        children: [
                          radioButton1,
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.asset(
                              image1,
                              width: iconWidth,
                              height: iconHeight,
                            ),
                          ),
                          Text(
                            getCurrentLanguageValue(CREDIT_CARD)!,
                            style: SafeGoogleFont(
                              'Montserrat',
                              color: black,
                              fontSize: paymentMethodSize,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        radioButton2,
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset(
                            image2,
                            width: iconWidth,
                            height: iconHeight,
                          ),
                        ),
                        Text(
                          getCurrentLanguageValue(BANK_TRANSFER)!,
                          style: SafeGoogleFont(
                            'Montserrat',
                            color: black,
                            fontSize: paymentMethodSize,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Text(
                getCurrentLanguageValue(PAYMENT_DETAIL)!,
                style: SafeGoogleFont(
                  'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: black,
                  fontSize: paymentFontSize,
                ),
              ),
              Visibility(
                visible: isCreditCard,
                child: CreditCardForm(
                  cvvController: cvvController,
                  expiryDateController: expiryDateController,
                  nameCardController: nameCardController,
                  numberCardController: numberCardController,
                  paddingBetweenInput: paddingBetweenInput,
                  expiryDateValidator: expiryDateValidator,
                  cvvValidator: cvvValidator,
                  nameCardValidator: nameCardValidator,
                  numberCardValidator: numberCardValidator,
                ),
              ),
              Visibility(
                  visible: !isCreditCard,
                  child: Padding(
                    padding: EdgeInsets.only(top: paddingTop),
                    child: BankTransferForm(
                      price: price,
                      purpose: purpose,
                    ),
                  )),
              Container(
                alignment: alignment,
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    ActionButtonV2(
                      action: isCreditCard ? onTap : sendBankTransfer,
                      maxWidth: 300,
                      text: isCreditCard
                          ? getCurrentLanguageValue(PAYMENT_CONFIRM)!
                          : 'Invia ricevuta bonifico',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.popUntil(context,
                                ModalRoute.withName(RouteConstants.subEdit));
                          },
                          child: Texth4V2(
                            testo: getCurrentLanguageValue(BACK)!,
                            color: background,
                            weight: FontWeight.w700,
                            underline: true,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
