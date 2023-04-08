import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study_partner_teach/entities/user.dart';
import 'package:study_partner_teach/pages/validation.dart';
import 'package:study_partner_teach/services/api/auth_services.dart';
import 'package:study_partner_teach/utils/Colors.dart';
import 'package:study_partner_teach/utils/utils.dart';
import 'package:study_partner_teach/widgets/comman_text.dart';
import 'package:study_partner_teach/widgets/main_logo.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();
  Validation validate= Validation();
  MockAuthService authservice = MockAuthService();
  String _phoneNumber = "";
  @override

  login() async{
    if(_formKey.currentState == null){
      return;
    }
    if (! _formKey.currentState!.validate())  return;
    _formKey.currentState!.save();
    print("Phane No.: $_phoneNumber");
    User newuser =User(name: "", phoneNumber: _phoneNumber);
    bool isvalid =await authservice.logIn(newuser);
    if(isvalid){
      Utility.customSnackBar(context: context, message: "Successfully Logged In.");
      Navigator.pushNamedAndRemoveUntil(context, '/home',(route) => false);
    }
    else{
      print("Could not Log in the user");
    }
  }

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40,),
              const Center(child: MainLogo(),),
              const SizedBox(height: 30,),
              Image.asset('assets/log_in_img.png'),
              SizedBox(height: 20,),
              Text1(text: "Welcome back Partner"),
              SizedBox(height: 20,),
              Text2(text: "LOG IN",),
              FormUI(size),
              SizedBox(height: 20,),
              Container(color: AppColors.txt_grey, width: size.width*0.825, height: 1.2,),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text3(text: "Don't have account?"),
                    TextButton(
                      onPressed: (){
                        Navigator.pushNamedAndRemoveUntil(context, '/signup',(route) => false);
                      },
                      child: Text(
                        "Create account",
                        style: TextStyle(
                          color: AppColors.but_orange,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w800,
                          fontSize: 14.8,
                          letterSpacing: 0.46,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget FormUI(Size size){
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(35, 5, 35, 10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: "",
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => validate.validateMobile(value),
                onSaved: (val) {
                  _phoneNumber= val ?? "";
                },
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  hintStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    letterSpacing: 0.15,
                    color: AppColors.txt_grey,
                  ),
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(35,20,35,16),
              width: size.width,
              child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    backgroundColor: AppColors.but_black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    shadowColor: AppColors.but_shadow_black,
                  ),
                  child: const Text("Log In",
                    style: TextStyle(
                      fontSize: 19,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.46,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  )),
            ),
          ],
        )
    );
  }
}
