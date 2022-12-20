import 'package:flutter/widgets.dart';
import 'package:innerix_mvvm/model/user_register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpViewModel extends ChangeNotifier{

  Future<bool> saveSignupUser(UserRegisterModel userSignup) async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', userSignup.token.toString());
    notifyListeners();

    return true;

  }

  Future<UserRegisterModel> getSignUpUser() async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String?  token = sp.getString('token');

    return UserRegisterModel(
      token: token.toString()
    );
  }

  Future <bool> removeSignUp () async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');

    return true;

  }
}