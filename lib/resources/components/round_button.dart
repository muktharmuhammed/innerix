import 'package:flutter/material.dart';

import '../color.dart';

class RoundButton extends StatelessWidget {

  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton({Key? key,
    required this.loading,
    required this.onPress,
    required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 55,
        width: 400,
        decoration: BoxDecoration(
          color: AppColors.buttoncolor,
          borderRadius: BorderRadius.circular(5)
        ),
        child:loading? const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ): Center(child: Text(title,style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          fontWeight: FontWeight.w700
        ),),) ,

      ),
    );
  }
}
