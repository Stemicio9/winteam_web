import 'package:flutter/material.dart';
import 'package:winteam_web/constants/colors.dart';
import 'package:winteam_web/constants/route_constants.dart';
import 'package:winteam_web/constants/validators.dart';
import 'package:winteam_web/entities/subscription_entity.dart';
import 'package:winteam_web/pages/W1n_scaffold.dart';
import 'package:winteam_web/pages/internal_page/payment_widgets/payment_form.dart';
import 'package:winteam_web/pages/internal_page/subscription_edit.dart';
import 'package:winteam_web/pages/internal_page/subscription_widgets/subscription_card.dart';




enum PaymentMethod { creditCard, payPal }


class PaymentWidget extends StatelessWidget {


  SubscriptionEntity? subscription;



  List<String> featuresList = [
    '3 Post',
    'Funzionalità 1',
    'Funzionalità 2',
    'Funzionalità 3',
    'Funzionalità 4',
  ];
  final TextEditingController nameCardTextController = TextEditingController();
  final TextEditingController numberCardTextController = TextEditingController();
  final TextEditingController cvvTextController = TextEditingController();
  final TextEditingController expirydateTextController = TextEditingController();
  bool isCreditCard = true;
  PaymentMethod? paymentMethod = PaymentMethod.creditCard;
  double paddingCard = 40;
  Alignment alignment = Alignment.centerRight;
  double paddingBetweenCardSection = 40;
  double titleFontSize = 32;
  double paymentFontSize =  18;
  double iconWidth = 60;
  double iconHeight = 60;
  double paymentMethodSize = 14;
  double paddingBottom = 0;
  double paddingTop = 0;



  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    try {
      subscription = arguments['subscription'];
      if(subscription == null){
         return SubscriptionEdit();
      }
    }catch(e){
      return SubscriptionEdit();
    }
      return Payment(subscription: subscription);

  }

}

class Payment extends StatefulWidget {

  SubscriptionEntity? subscription;

  Payment({this.subscription});

  @override
  State<StatefulWidget> createState() {
    return PaymentState();
  }
}

class PaymentState extends State<Payment> {



  List<String> featuresList = [
    '3 Post',
    'Funzionalità 1',
    'Funzionalità 2',
    'Funzionalità 3',
    'Funzionalità 4',
  ];
  final TextEditingController nameCardTextController = TextEditingController();
  final TextEditingController numberCardTextController = TextEditingController();
  final TextEditingController cvvTextController = TextEditingController();
  final TextEditingController expirydateTextController = TextEditingController();
  bool isCreditCard = true;
  PaymentMethod? paymentMethod = PaymentMethod.creditCard;
  double paddingCard = 40;
  Alignment alignment = Alignment.centerRight;
  double paddingBetweenCardSection = 40;
  double titleFontSize = 32;
  double paymentFontSize =  18;
  double iconWidth = 60;
  double iconHeight = 60;
  double paymentMethodSize = 14;
  double paddingBottom = 0;
  double paddingTop = 0;

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    double baseWidth = 1284;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return W1NScaffold(
        title: Image.asset('assets/images/logo-white.png', height: 200),
        showAppBar: true,
        body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 850) {
            paymentMethodSize = 14;
            titleFontSize = 32;
            paymentFontSize = 18;
            return Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: getForm()),
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: getCard()),
              ],
            );
          } else {
            paddingTop = 22;
            iconWidth = 25;
            iconHeight = 25;
            alignment = Alignment.center;
            paymentMethodSize = 50 * ffem;
            titleFontSize = 75 * ffem;
            paymentFontSize = 55 * fem;
            paddingCard = 20;
            paddingBottom = 10;
            paddingBetweenCardSection = 50;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    getForm(),
                    getCard()
                  ],
                ),
              ),
            );
          }
        }));
  }

  getForm() {
    return Form(
      key: _formKey,
      child: PaymentForm(
        price: widget.subscription?.price ?? '',
        purpose: widget.subscription?.title ?? '',
        sendBankTransfer: (){},
        paddingTop: paddingTop,
        isCreditCard: isCreditCard,
        paddingBottom: paddingBottom,
        paymentMethodSize: paymentMethodSize,
        iconWidth: iconWidth,
        iconHeight: iconWidth,
        alignment: alignment,
        onTap: formSubmit,
        nameCardValidator: notEmptyValidate,
        numberCardValidator: notEmptyValidate,
        cvvValidator: notEmptyValidate,
        expiryDateValidator: notEmptyValidate,
        cvvController: cvvTextController,
        nameCardController: nameCardTextController,
        numberCardController: numberCardTextController,
        expiryDateController: expirydateTextController,
        paymentFontSize:paymentFontSize,
        titleFontSize: titleFontSize,
        paddingBetweenCardSection: paddingBetweenCardSection,
        paddingBetweenInput: 20,
        paddingCard: paddingCard,
        image1: 'assets/images/credit_card_icon.png',
        image2: 'assets/images/bank_icon.png',
        radioButton1: Radio<PaymentMethod>(
          activeColor: black,
          value: PaymentMethod.creditCard,
          groupValue: paymentMethod,
          onChanged: (PaymentMethod? value) {
            setState(() {
              paymentMethod = value;
              isCreditCard = !isCreditCard;
            });
          },
        ),
        radioButton2: Radio<PaymentMethod>(
          activeColor: black,
          value: PaymentMethod.payPal,
          groupValue: paymentMethod,
          onChanged: (PaymentMethod? value) {
            setState(() {
              paymentMethod = value;
              isCreditCard = !isCreditCard;
            });
          },
        ),
      ),
    );
  }

  getCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SubscriptionCard(
              padding: 30,
              cardTitle: widget.subscription?.title ?? '',
              price: widget.subscription?.price ?? '',
              onTap: () {},
              text: '',
              featuresList: widget.subscription?.features ?? [],
              isVisible: false
          ),
        ],
      ),
    );
  }

  formSubmit() async {
    if (_formKey.currentState!.validate()) {
    }
  }
}
