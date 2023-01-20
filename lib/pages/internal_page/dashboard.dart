import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:winteam_web/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam_web/blocs/user_bloc/user_list_cubit.dart';
import 'package:winteam_web/constants/colors.dart';
import 'package:winteam_web/model/user_entity.dart';
import 'package:winteam_web/pages/W1n_scaffold.dart';
import 'package:winteam_web/widgets/header.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  UserCubit get _cubit => context.read<UserCubit>();

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
        return pageContent(state.user);
      } else {
        return const Center(
          child: Text("ERRORE DURANTE LA CONNESSIONE AL SERVER"),
        );
      }
    });
  }

  Widget pageContent(UserEntity entity) {
    const sh= 2;
  return Scaffold(
    body: GridView.custom(
    gridDelegate: SliverQuiltedGridDelegate(
    crossAxisCount: 9,
    mainAxisSpacing: 20,
    crossAxisSpacing: 20,
    repeatPattern: QuiltedGridRepeatPattern.mirrored,
    pattern: [
      QuiltedGridTile(sh * 2, 3),
      QuiltedGridTile(sh, 3),
      QuiltedGridTile(sh, 3), //topE

      QuiltedGridTile(sh, 3),
      QuiltedGridTile(sh, 3),

      QuiltedGridTile(sh, 3),
      QuiltedGridTile(sh, 2),
      QuiltedGridTile(sh, 2),
      QuiltedGridTile(sh, 2),
    ],
  ), childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => Container(),
        childCount: 9),));


    /*return Stack(children: [
      Align(alignment: Alignment.topCenter, child: getWidgetTitle()),
      GridView.custom(
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 9,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          repeatPattern: QuiltedGridRepeatPattern.mirrored,
          pattern: [
            QuiltedGridTile(sh * 2, 3),
            QuiltedGridTile(sh, 3),
            QuiltedGridTile(sh, 3), //topE

            QuiltedGridTile(sh, 3),
            QuiltedGridTile(sh, 3),

            QuiltedGridTile(sh, 3),
            QuiltedGridTile(sh, 2),
            QuiltedGridTile(sh, 2),
            QuiltedGridTile(sh, 2),
          ],
        ),
          childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => Container(),
          childCount: 9)
      )]
    );*/
  }

  Widget getWidgetTitle() {
    return const HeaderWidget(
      title: Text(
        "Gestisci il tuo abbonamento",
        style: TextStyle(
          color: background,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
