import 'package:flutter/material.dart';
import 'package:innerix_mvvm/utils/routes/routes.dart';
import 'package:innerix_mvvm/utils/routes/routes_name.dart';
import 'package:innerix_mvvm/view_model/auth_view_model.dart';
import 'package:innerix_mvvm/view_model/signup_view_model.dart';
import 'package:innerix_mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import 'view_model/home_view_model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => UserViewModel()),
          ChangeNotifierProvider(create: (_) => SignUpViewModel()),
          ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'poppins',
            primarySwatch: Colors.blue,
          ),
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes.generateRoute
      ),
    );
  }
}

