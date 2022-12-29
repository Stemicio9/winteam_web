


import 'package:flutter/material.dart';
import 'package:winteam_web/pages/W1n_scaffold.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    print("STO RICHIAMANDO DASHBOARD");
    return W1NScaffold(
        body: Container(
          child: Column(
            children: const [
              Text("Dashboard"),
              Text("Dashboard"),
              Text("Dashboard"),
              Text("Dashboard"),
              Text("Dashboard"),
              Text("Dashboard"),
              Text("Dashboard"),
              Text("Dashboard"),
              Text("Dashboard"),
            ],
          )
        )
    );
  }
}
