import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam_web/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam_web/blocs/user_bloc/user_list_cubit.dart';
import 'package:winteam_web/constants/language.dart';
import 'package:winteam_web/constants/route_constants.dart';
import 'package:winteam_web/model/user_entity.dart';
import 'package:winteam_web/pages/W1n_scaffold.dart';
import 'package:winteam_web/pages/internal_page/dashboard_widgets/employees_search_card.dart';
import 'package:winteam_web/pages/internal_page/dashboard_widgets/expiring_date_card.dart';
import 'package:winteam_web/pages/internal_page/dashboard_widgets/features_card.dart';
import 'package:winteam_web/pages/internal_page/dashboard_widgets/posts_available_card.dart';
import 'package:winteam_web/pages/internal_page/dashboard_widgets/profile_card.dart';
import 'package:winteam_web/pages/internal_page/dashboard_widgets/subscription_type_card.dart';
import 'package:winteam_web/widgets/header.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  UserCubit get _cubit => context.read<UserCubit>();

  String subscriptionType = 'Base';
  String posts = '4';
  String imageProfile = 'assets/images/profiledefault.jpeg';

  List<String> featuresList = [
    '3 Post',
    'Funzionalità 1',
    'Funzionalità 2',
    'Funzionalità 3',
    'Funzionalità 4',
  ];
  String date = '24/01/2023';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserListCubit(),
      child: W1NScaffold(
        body: buildBlocs(),
        title: Image.asset('assets/images/logo-white.png', height: 200),
        showAppBar: true,
      ),
    );
  }

  @override
  void initState() {
    _cubit.me();
    super.initState();
  }

  Widget buildBlocs() {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state is UserLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is UserLoaded) {

        return LayoutBuilder(builder: (context,contrains){
          if(contrains.maxWidth > 850) {
            return pageContent(state.user);
          }else{
            return SingleChildScrollView(
              child: pageContent(state.user)
            );
          }
          }
        );


      } else {
        return const Center(
          child: Text("ERRORE DURANTE LA CONNESSIONE AL SERVER"),
        );
      }
    });
  }

  Widget pageContent(UserEntity entity) {
    double baseWidth = 1284;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeaderWidget(
            pageTitle: getCurrentLanguageValue(MANAGE_SUBSCRIPTION)!,
            name: entity.companyName!,
            isVisible: true,
          ),
          Container(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15,right: 15, top: 30),
                  child: Column(
                    children: [
                      ProfileCard(
                          profileImage: imageProfile,
                          rating: entity.rating!),
                      SubscriptionTypeCard(
                          subscriptionType: subscriptionType,
                          onTap: (){Navigator.pushNamed(context, RouteConstants.subEdit);}
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 15,left: 15, top: 30),
                  child: Column(
                    children: [
                      FeaturesCard(
                        featuresList: featuresList,
                      ),
                      ExpiringDateCard(
                        date: date,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 30,right: 15),
                  child: Column(
                    children: [
                      PostsAvailableCard(posts: posts, onTap:(){Navigator.pushNamed(context, RouteConstants.subEdit);}),
                      EmployeesSearchCard(onTap: (){},)
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding:const  EdgeInsets.only(top: 30),
          )
        ],

    );
  }
}
