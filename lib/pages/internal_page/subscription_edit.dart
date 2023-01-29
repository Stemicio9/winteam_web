import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:winteam_web/constants/colors.dart';
import 'package:winteam_web/constants/language.dart';
import 'package:winteam_web/constants/route_constants.dart';
import 'package:winteam_web/entities/subscription_entity.dart';
import 'package:winteam_web/pages/W1n_scaffold.dart';
import 'package:winteam_web/pages/internal_page/subscription_widgets/subscription_card.dart';
import 'package:winteam_web/pages/internal_page/subscription_widgets/subscription_page_content.dart';
import 'package:winteam_web/widgets/header.dart';
import 'package:winteam_web/widgets/texts_v2.dart';

class SubscriptionEdit extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SubscriptionEditState();
  }
}

class SubscriptionEditState extends State<SubscriptionEdit> {
  List<SubscriptionEntity> subscriptionList = [
    SubscriptionEntity(
        price: '30',
        title: 'Base',
        features: [
          '3 Post',
          'Funzionalità 1',
          'Funzionalità 2',
          'Funzionalità 3',
          'Funzionalità 4',
        ],
        isActive: true),
    SubscriptionEntity(
        price: '75',
        title: 'Avanzato',
        features: [
          '3 Post',
          'Funzionalità 1',
          'Funzionalità 2',
          'Funzionalità 3',
          'Funzionalità 4',
        ],
        isActive: false),
    SubscriptionEntity(
        price: '120',
        title: 'Pro',
        features: [
          '3 Post',
          'Funzionalità 1',
          'Funzionalità 2',
          'Funzionalità 3',
          'Funzionalità 4',
        ],
        isActive: false),
  ]; //list of boolean to determine which subscription is currently active

  @override
  Widget build(BuildContext context) {
    return W1NScaffold(
        title: Image.asset('assets/images/logo-white.png', height: 200),
        showAppBar: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderWidget(
              pageTitle: getCurrentLanguageValue(EDIT_SUBSCRIPTION)!,
            ),
            LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return SubscriptionPageContent(subscriptions: subscriptionList);
              } else {
                return getCarouselSlider();
              }
            }),
            getWidgetBackButton(),
          ],
        ));
  }

  Widget getWidgetBackButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.popUntil(
              context, ModalRoute.withName(RouteConstants.dashboard));
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Texth4V2(
            testo: getCurrentLanguageValue(BACK)!,
            color: white,
            weight: FontWeight.w700,
            underline: true,
          ),
        ),
      ),
    );
  }

  Widget getCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
          height: 535,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          enableInfiniteScroll: false),
      items: subscriptionList.map((subscription) {
        return Builder(
          builder: (BuildContext context) {
            return SubscriptionCard(
              cardTitle: subscription.title,
              price: subscription.price,
              isActive: subscription.isActive,
              onTap: () {
                Navigator.of(context)
                    .pushNamed(RouteConstants.payment, arguments: {
                  'subscription': subscription,

                });
              },
              text: getCurrentLanguageValue(PASS_TO)!,
              actualText: getCurrentLanguageValue(CURRENT_SUB)!,
              featuresList: subscription.features,
            );
          },
        );
      }).toList(),
    );
  }
}
