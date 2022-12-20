
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../model/user_model.dart';
import '../../utils/routes/routes_name.dart';
import '../../view_model/user_view_model.dart';

class SplashServices{
  Future <UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async{
    getUserData().then((value){

      if(value.token == 'null' || value.token ==''){
        Future.delayed(const Duration(seconds: 10));
        Navigator.popAndPushNamed(context, RoutesName.login);
      }
      else{
        Future.delayed(const Duration(seconds: 3));
        Navigator.popAndPushNamed(context, RoutesName.home);
      }

    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });
  }
}