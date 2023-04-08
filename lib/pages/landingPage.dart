import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:study_partner_teach/entities/user.dart';
import 'package:study_partner_teach/pages/auth.dart';
import 'package:study_partner_teach/pages/home.dart';
import 'package:study_partner_teach/services/db/shared_prefs.dart';
import 'package:study_partner_teach/utils/Colors.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  void initState() {
    super.initState();
    // init();
      final route =MaterialPageRoute(
          builder: (context) => const Authentication()
      );
      Navigator.pushAndRemoveUntil(context,route , (route) => false);

  }
  void init() async {
    print("Init");
    var prefs =SharedPrefs();
    bool isLoggedIn= await prefs.isLoggedIn();
    if(isLoggedIn){
      print("User is logged In");
      User user = prefs.user;
      final route =MaterialPageRoute(
          builder: (context) => const HomePage()
      );
      Navigator.pushAndRemoveUntil(context,route , (route) => false);
    }
    else{
      print("Not logged in");
      final route =MaterialPageRoute(
          builder: (context) => const Authentication()
      );
      Navigator.pushAndRemoveUntil(context,route , (route) => false);
    }
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
