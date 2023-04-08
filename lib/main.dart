import 'package:flutter/material.dart';
import 'package:study_partner_teach/pages/auth.dart';
import 'package:study_partner_teach/pages/landingPage.dart';
import 'package:study_partner_teach/pages/logIn.dart';
import 'package:study_partner_teach/pages/otp.dart';
import 'package:study_partner_teach/pages/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        // primaryTextTheme: TextTheme()
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // final Logo = const MainLogo();
    return Scaffold(
      body: const LogInPage(),
    );
  }
}
