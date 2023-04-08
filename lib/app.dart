import 'package:flutter/material.dart';
import 'package:study_partner_teach/pages/auth.dart';
import 'package:study_partner_teach/pages/home.dart';
import 'package:study_partner_teach/pages/landingPage.dart';
import 'package:study_partner_teach/pages/logIn.dart';
import 'package:study_partner_teach/pages/otp.dart';
import 'package:study_partner_teach/pages/signup.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Flutter Demo',
      // initialRoute: '/',
      // home: LandingPage(),
      routes: {
        '/' : (context) => const Authentication(),
        '/login' : (context) => const LogInPage(),
        '/signup' : (context) => const SignUpPage(),
        '/home' : (context) => const HomePage(),
      },
    );
}
