

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winteam_web/authentication/firebase_repository.dart';
import 'package:winteam_web/blocs/user_bloc/current_user_cubit.dart';
import 'package:winteam_web/blocs/user_bloc/user_list_cubit.dart';
import 'package:winteam_web/constants/colors.dart';
import 'package:winteam_web/constants/language.dart';
import 'package:winteam_web/constants/route_constants.dart';
import 'package:winteam_web/model/user_entity.dart';
import 'package:winteam_web/widgets/action_buttons_v2.dart';
import 'package:winteam_web/widgets/checkbox_v2.dart';
import 'package:winteam_web/widgets/inputs_v2.dart';
import 'package:winteam_web/widgets/texts_v2.dart';
import 'package:winteam_web/widgets/utilities/image_utility.dart';


class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserListCubit(),
      child: LoginFormV2(),
    );
  }
}


class LoginFormV2 extends StatefulWidget{
  @override
  LoginFormV2State createState() {
    return LoginFormV2State();
  }
}

class LoginFormV2State extends State<LoginFormV2> {

  UserCubit get _cubit => context.read<UserCubit>();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
   /* return BlocBuilder<UserCubit, UserState>(
        builder: (_, state) {
          if (state is NotAuthenticated) {
            // todo
            // here insert login form
            return Container();
          } else if (state is UserAuthenticated) {
            // todo
            // navigare verso la pagina corretta
            return Container();
          } else if (state is UserAuthenticationLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            // UserErrorAuthentication
            // todo
            // restituire form con errori in evidenza
            return Container();
          }
        }); */

    // for testing purpose, insert here Login form
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [

              logoSection(),

              loginTextSection(),

              loginSection(),

              forgotPasswordSection(),


          ],
        )
      ),
    );
  }

  formsubmit() async {
    if (_formKey.currentState!.validate()) {
      UserCredential? log = await signIn(_emailTextController.text, _passwordTextController.text);

      if(log == null || log.user == null){
        // @todo avvisare che il login è sbagliato
        return;
      }

      var a = await log!.user!.getIdToken();

      // DATORE, LAVORATORE, INFLUENCER
      UserEntity? entity = await _cubit.me();

      if(entity == null) return;


      if(entity.roleId == "DATORE"){
        Navigator.pushNamed(context, RouteConstants.dashboard);
      }else {
        // todo lanciare un messaggio di errore o non so cosa, è entrato un lavoratore!!!!
      }
    }
  }

  Widget logoSection(){
    return  Container(
      width: MediaQuery.of(context).size.width,
      child: const ImagePlaceholder(
        name: LOGO_IMAGE_NAME,
      ),
    );
  }

  Widget loginTextSection(){
    return Texth1V2(
      testo: LOGIN,
      color: white,
      weight: FontWeight.w600,

    );
  }

  Widget loginSection(){
    return Column(
      children: [

        InputsV2Widget(
          hinttext: EMAIL,
          controller: _emailTextController,
        ),

        InputsV2Widget(
          hinttext: PASSWORD,
          controller: _passwordTextController,
          ispassword: true,
        ),

        CheckboxV2Widget(),

        ActionButtonV2(LOGIN,formsubmit,
            315),
      ],
    );
  }

  Widget forgotPasswordSection(){
    return GestureDetector(
        onTap: vaiapaginapassworddimenticata,
        child: Texth3V2(
      testo: FORGOT_PASSWORD,
      color: white,
      underline: true,
        )
    );
  }



  vaiapaginapassworddimenticata(){
    Navigator.of(context).pushNamed(RouteConstants.passDimenticata);
  }


}


