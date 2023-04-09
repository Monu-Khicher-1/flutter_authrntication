import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_partner_teach/entities/user.dart';
import 'package:study_partner_teach/utils/Constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  getData() async{
    final SharedPreferences shared_prefs = await SharedPreferences.getInstance();
    setState(() {
      Constants.PhoneNo = shared_prefs.getString('phone');
    });
  }

  @override
  void initState(){
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 180,),
            Text("Home Says Phone no. is ${Constants.PhoneNo}"),
            SizedBox(height: 60,),
            ElevatedButton(
                onPressed: () async {
                  final SharedPreferences shared_prefs = await SharedPreferences.getInstance();
                  shared_prefs.remove('phone');
                  Constants.PhoneNo=null;
                  Navigator.pushNamedAndRemoveUntil(context, '/auth', (route) => false);
                },
                child: Text("Log out")),
          ],
        ),
      ),
    );
  }
}
