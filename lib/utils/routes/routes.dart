import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innerix_mvvm/utils/routes/routes_name.dart';
import 'package:innerix_mvvm/view/forgot_password.dart';
import '../../view/home_screen.dart';
import '../../view/login_screen.dart';
import '../../view/signup_screen.dart';
import '../../view/spalsh_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context ) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context ) => LoginScreen());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (BuildContext context ) => SignUpView());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context ) => SplashView());
      case RoutesName.forgot:
        return MaterialPageRoute(builder: (BuildContext context ) => ForgotPassword());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('No page found'),
            ),
          );
        });

    }
  }
}