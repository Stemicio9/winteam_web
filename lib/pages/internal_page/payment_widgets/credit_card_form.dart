import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:winteam_web/constants/language.dart';

class CreditCardForm extends StatelessWidget {
  final TextEditingController nameCardController;
  final TextEditingController numberCardController;
  final TextEditingController cvvController;
  final TextEditingController expiryDateController;
  final dynamic nameCardValidator;
  final dynamic numberCardValidator;
  final dynamic cvvValidator;
  final dynamic expiryDateValidator;
  final double paddingBetweenInput;

  CreditCardForm(
      {required this.cvvController,
      required this.expiryDateController,
      required this.nameCardController,
      required this.numberCardController,
      required this.paddingBetweenInput,
      required this.expiryDateValidator,
      required this.cvvValidator,
      required this.nameCardValidator,
      required this.numberCardValidator});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: paddingBetweenInput),
          child: TextFormField(
            validator: nameCardValidator,
            controller: nameCardController,
            decoration: InputDecoration(
                hintText: getCurrentLanguageValue(CREDIT_CARD_NAME)!),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: paddingBetweenInput),
          child: TextFormField(
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            validator: numberCardValidator,
            controller: numberCardController,
            maxLength: 16,
            decoration: InputDecoration(
                counterText: '',
                hintText: getCurrentLanguageValue(CREDIT_CARD_NUMBER)!),
          ),
        ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextFormField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: expiryDateValidator,
                      controller: expiryDateController,
                      decoration: InputDecoration(
                          hintText: getCurrentLanguageValue(EXPIRING)!),
                    ))),
            Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      maxLength: 3,
                      validator: cvvValidator,
                      controller: cvvController,
                      decoration: InputDecoration(
                          counterText: '',
                          hintText: getCurrentLanguageValue(CVV)!),
                    ))),
          ],
        ),
      ],
    );
  }
}
