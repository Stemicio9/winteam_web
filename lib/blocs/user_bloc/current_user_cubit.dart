
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit/retrofit.dart';
import 'package:winteam_web/blocs/user_api_service/user_api_service.dart';
import 'package:winteam_web/model/user_entity.dart';


part 'current_user_cubit_state.dart';


const String DUMMY_NAME = "EGG";
const String DUMMY_EMAIL = "s.miceli90@gmail.com";

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLoading());

  late UserEntity _user;
  UserEntity get user => _user;

  Future<UserEntity?> me() async {
    emit(UserLoading());
    try {
      HttpResponse<dynamic> result = await userListApiService.me();

      var encoded = jsonEncode(result.data);
      var decoded = jsonDecode(encoded);
      var json = UserEntity.fromJson(decoded);
      _user = json;
      print("UserCubit: $_user");
      emit(UserLoaded(json));
      return json;
    } catch (e) {
      print(e);
      emit(UserError());
    }
  }


  Future<void> update(UserEntity userEntity) async {
    emit(UserLoading());
    try{
      var a = await userListApiService.updateUser(userEntity);
      me();
    }catch(e){
      print(e);
      emit(UserError());
    }
  }



  logout(){
    emit(UserEmpty());
  }









}



