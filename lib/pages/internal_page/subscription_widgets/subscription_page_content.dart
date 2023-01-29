import 'package:flutter/material.dart';
import 'package:winteam_web/constants/language.dart';
import 'package:winteam_web/constants/route_constants.dart';
import 'package:winteam_web/entities/subscription_entity.dart';
import 'package:winteam_web/pages/internal_page/subscription_widgets/subscription_card.dart';

class SubscriptionPageContent extends StatelessWidget {
  final List<SubscriptionEntity> subscriptions;
  final double padding;

  SubscriptionPageContent({required this.subscriptions, this.padding = 18});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List<Widget>.generate(
              subscriptions.length,
              (int index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: SubscriptionCard(
                        cardTitle: subscriptions[index].title,
                        price: subscriptions[index].price,
                        text: getCurrentLanguageValue(PASS_TO)!,
                        actualText: getCurrentLanguageValue(CURRENT_SUB)!,
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteConstants.payment, arguments: {
                            'subscription': subscriptions[index],
                          });
                        },
                        isActive: subscriptions[index].isActive,
                        featuresList: subscriptions[index].features),
                  ))),
    );
  }
}
