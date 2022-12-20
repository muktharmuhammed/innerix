import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:innerix_mvvm/view_model/signup_view_model.dart';
import 'package:innerix_mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';
import '../model/user_register_model.dart';
import '../respositories/auth_respository.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier{

  final _myRepo = AuthRespository();

  bool _loading =false;
  bool get loading => _loading;

  bool _signuploading =false;
  bool get signuploading => _signuploading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  setSignupLoading(bool value){
    _signuploading = value;
    notifyListeners();
  }

  Future<void> loginApi( dynamic data, BuildContext context) async{

    setLoading(true);

    _myRepo.loginApi(data).then((value){
      setLoading(false);

      final userPreference = Provider.of<UserViewModel>(context,listen: false);
      userPreference.saveUser(UserModel(
        token: value['token'].toString()
      ));
      if(value['status']==true) {
        Utils.flushBarErrorMessage('Login Successfully', context);
        Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (route) => false);
      }
      else{
        Utils.flushBarErrorMessage('${value['message']}', context);
      }
      if(kDebugMode){
        print(value.toString());

      }

    }).onError((error, stackTrace){
      setLoading(false);
      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());

      }

    });

  }

  Future<void> signupApi( dynamic data, BuildContext context) async{

    setSignupLoading(true);

    _myRepo.signupApi(data).then((value){
      setSignupLoading(false);
      final userPreference = Provider.of<SignUpViewModel>(context,listen: false);
      userPreference.saveSignupUser(UserRegisterModel(
          token: value['token'].toString()
      ));

      Utils.flushBarErrorMessage('Registered Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());

      }

    }).onError((error, stackTrace){
      setSignupLoading(false);
      if(kDebugMode){
        Utils.flushBarErrorMessage('Email or Mobile number is already taken', context);
        print(error.toString());

      }

    });

  }
}