

import 'package:flutter/material.dart';
import 'package:winteam_web/pages/forgot_password/forgot_password.dart';
import 'package:winteam_web/pages/internal_page/dashboard.dart';
import 'package:winteam_web/pages/internal_page/payment.dart';
import 'package:winteam_web/pages/internal_page/subscription_edit.dart';
import 'package:winteam_web/pages/login/login_v2.dart';

class RouteConstants {
  static const String dashboard = "/dashboard";
  static const String login = "/login";
  static const String passDimenticata = "/passworddimenticata";
  static const String subEdit = "/subedit";
  static const String payment = "/payment";







  static dynamic route(context) => {
    '/': (context) =>  LoginPageV2(),
    login: (context) => LoginPageV2(),
    dashboard: (context) => const Dashboard(),
    subEdit: (context) => SubscriptionEdit(),
    payment: (context) => PaymentWidget(),
    passDimenticata: (context) => ForgotPassword(),

  };
}