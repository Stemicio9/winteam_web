


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam_web/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam_web/blocs/user_bloc/user_list_cubit.dart';
import 'package:winteam_web/model/user_entity.dart';
import 'package:winteam_web/pages/W1n_scaffold.dart';

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
          body: buildBlocs()
      ),
    );;
  }

  @override
  void initState() {
    _cubit.me();
    super.initState();
  }


  Widget buildBlocs(){
    return BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            return pageContent(state.user);
          } else {
            return const Center(child: Text("ERRORE DURANTE LA CONNESSIONE AL SERVER"),);
          }
        }
    );
  }


  Widget pageContent(UserEntity entity){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("NOME UTENTE"),
          Text(entity.firstName ?? ""),
        ],
      ),
    );
  }


}
