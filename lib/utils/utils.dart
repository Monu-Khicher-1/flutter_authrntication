import 'package:flutter/material.dart';
import 'package:study_partner_teach/utils/Colors.dart';

class Utility{
  static void customSnackBar({
    required BuildContext context , required String message ,
    Color backgroundColor = AppColors.but_black , Color textColor = Colors.white,
  }){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message, style: TextStyle( color: textColor),),
        backgroundColor: backgroundColor,
      )
    );
  }
}