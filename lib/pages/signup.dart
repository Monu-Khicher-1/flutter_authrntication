
import 'package:flutter/material.dart';
import 'package:study_partner_teach/entities/user.dart';
import 'package:study_partner_teach/pages/otp.dart';
import 'package:study_partner_teach/pages/validation.dart';
import 'package:study_partner_teach/services/api/auth_services.dart';
import 'package:study_partner_teach/utils/Colors.dart';
import 'package:study_partner_teach/utils/utils.dart';
import 'package:study_partner_teach/widgets/comman_text.dart';
import 'package:study_partner_teach/widgets/main_logo.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}


class _SignUpPageState extends State<SignUpPage> {
  MockAuthService authservice =MockAuthService();
  final _formKey = GlobalKey<FormState>();
  final Validation validate =Validation();

  String _username = "";
  String _phoneNumber = "";
  AutovalidateMode? _ValidationMode = AutovalidateMode.disabled;
  bool agreedTerms = false;


  void signup() async{
    if(_formKey.currentState == null){
      _ValidationMode = AutovalidateMode.onUserInteraction;
      return;
    }
    if (! _formKey.currentState!.validate())  return;
    _formKey.currentState!.save();
    print("Name:$_username Phane No.: $_phoneNumber");
    User newUser =User(name: _username, phoneNumber: _phoneNumber);
    bool isvalid =await authservice.signUp(newUser);
    if(isvalid){
      Utility.customSnackBar(context: context, message: "Data sent successfully.");
      final route =MaterialPageRoute(
          builder: (context) => OtpPage(_phoneNumber.toString())
      );
      Navigator.push(context,route);

    }
    else{
      print("Could not Sign up the user");
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40,),
                Center(child: MainLogo(),),
                const SizedBox(height: 40,),
                Image.asset('assets/sign_up_img.png'),
                SizedBox(height: 20,),
                Text1(text: "Don't be a stranger",),
                SizedBox(height: 40,),
                Text2(text: "CREATE ACCOUNT",),
                FormUI(size),
                Container(color: AppColors.txt_grey, width: size.width*0.825, height: 1.2,),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text3(text: "Already have an account?"),
                      TextButton(
                        onPressed: (){
                          Navigator.pushNamedAndRemoveUntil(context, '/login',(route) => false);
                        },
                        child: Text(
                          "Log In",
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
      ),
    );
  }
  Widget FormUI(Size size){
    return Form(
        key: _formKey,
        autovalidateMode: _ValidationMode,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(35, 10, 35, 10),
              child: TextFormField(
                initialValue: "",
                 autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => validate.validateName(value),
                onSaved: (val) {
                  _username = val ?? "";
                },
                decoration: InputDecoration(
                  hintText: 'Full Name',
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
            Padding(
              padding: EdgeInsets.fromLTRB(35, 5, 35, 10),
              child: TextFormField(
                initialValue: "",
                keyboardType: TextInputType.phone,
                autovalidateMode:AutovalidateMode.onUserInteraction,
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
                  onPressed: signup,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    backgroundColor: AppColors.but_black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    shadowColor: AppColors.but_shadow_black,
                  ),
                  child: const Text("Sign Up",
                    style: TextStyle(
                      fontSize: 19,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.46,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  )),
            ),
            FormField<bool>(
              autovalidateMode:AutovalidateMode.onUserInteraction,
              initialValue: agreedTerms,
              builder: (FormFieldState<bool> state) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(25, 4, 25, 4),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            activeColor: AppColors.but_orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            value: state.value,
                            onChanged: (bool? value) {
                              setState(() {
                                agreedTerms = value ?? !agreedTerms;
                                state.didChange(value);
                                // print("Check box ${agreedTerms}.");
                              });
                            },
                          ),
                          Expanded(
                            child: Text3(
                              text: "I agree to the terms and conditions as set out by the user agreement.",),
                          ),
                        ],
                      ),
                      (state.errorText == null) ? Text('') :
                      Text(state.errorText ?? "", style: TextStyle(color: Colors.red),),
                    ],
                  ),
                );
              },
              validator: (val) => validate.validateCheckbox(agreedTerms),
            ),
          ],
        )
    );
  }
}


