

import 'package:flutter/material.dart';
import 'package:winteam_web/pages/internal_page/dashboard.dart';
import 'package:winteam_web/pages/login/login_v2.dart';

class RouteConstants {
  static const String dashboard = "/dashboard";
  static const String login = "/login";
  static const String passDimenticata = "/passworddimenticata";







  static dynamic route(context) => {
    '/': (context) =>  LoginPageV2(),
    login: (context) => LoginPageV2(),
    dashboard: (context) => const Dashboard(),
    passDimenticata: (context) => Container(child: const Center(child: Text("PASSWORD DIMENTICATA"),),),
    // todo add internal page
  };
}