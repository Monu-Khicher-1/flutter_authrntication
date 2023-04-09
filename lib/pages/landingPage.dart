import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_partner_teach/utils/Colors.dart';
import 'package:study_partner_teach/utils/Constants.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  void initState() {
    super.initState();
    getValidationData().whenComplete(() async {
    Timer(Duration(seconds: 2),()=>Navigator.of(context).pushNamedAndRemoveUntil(Constants.PhoneNo==null ? '/auth' : '/home', (route) => false));
    }
    );

    // init();

  }
 Future getValidationData() async{
    final SharedPreferences shared_prefs = await SharedPreferences.getInstance();
    Constants.PhoneNo = shared_prefs.getString('phone');
    print("Shared Prefs say phone: ${Constants.PhoneNo}");
 }
  @override
  Widget build(BuildContext context) {
    print("Hello..");
    return  Scaffold(
      body: SafeArea(
      child: Container(
        color: AppColors.but_black,
        child: Center(
              child: SvgPicture.asset('assets/landing_logo.svg'),
            ),
          ),
      ),
    );
  }
}
