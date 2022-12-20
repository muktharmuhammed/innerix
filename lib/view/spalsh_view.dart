import 'package:flutter/material.dart';
import 'package:innerix_mvvm/view/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    splashServices.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset('assets/images/Group 1.png'),

    );
  }
}
