import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study_partner_teach/entities/user.dart';
import 'package:study_partner_teach/pages/home.dart';
import 'package:study_partner_teach/services/api/auth_services.dart';
import 'package:study_partner_teach/utils/Colors.dart';
import 'package:study_partner_teach/utils/utils.dart';
import 'package:study_partner_teach/widgets/main_logo.dart';

class OtpPage extends StatefulWidget {
  const OtpPage( this.phone);
  final String phone;
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _formKey = GlobalKey<FormState>();
  MockAuthService authservice = MockAuthService();
  List<String> pins = ['0','0','0','0'];

  verify()  async{
    if(_formKey.currentState == null){
      return;
    }
    if (! _formKey.currentState!.validate())  return;
    _formKey.currentState!.save();
    String otp = pins[0]+pins[1]+pins[2]+pins[3];
    bool isvalid =await authservice.verifyOtp(otp);
    if(isvalid){
      Utility.customSnackBar(context: context, message: "OTP verified. Signup successfully!");
      Navigator.pushNamedAndRemoveUntil(context, '/home',(route) => false);

    }
    else{
      print("Could not Log in the user");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40,),
                MainLogo(),
                SizedBox(height: 100,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 8, 60, 8),
                  child: SizedBox(
                    height: 80,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Enter the OTP that was sent to your mobile number",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                          fontStyle: FontStyle.normal,
                          color: AppColors.but_black,
                          letterSpacing: 0.48,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

                OTPField(),
                Container(
                  padding: EdgeInsets.all(20),
                  width:120,
                  child: ElevatedButton(
                      onPressed: verify,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(8),
                        backgroundColor: AppColors.but_black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        shadowColor: AppColors.but_shadow_black,
                      ),
                      child: const Text("VERIFY",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          letterSpacing: 0.46,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                      )),
                ),
              ],
            ),
          )
      ),
    );
  }

  Widget OTPField(){
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Form(
        key:  _formKey ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 64,
              width: 64,
              child: TextFormField(
                onChanged: (value){
                  if(value?.length == 1){
                    FocusScope.of(context).nextFocus();
                  }
                },
                initialValue: '',
                onSaved: (pin1){
                  pins[0] = pin1 ?? '';
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Roboto',
                  color: AppColors.but_black,
                  fontSize: 28,
                ),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 64,
              width: 64,
              child: TextFormField(
                onChanged: (value){
                  if(value?.length == 1){
                    FocusScope.of(context).nextFocus();
                  }
                },
                initialValue: '',
                onSaved: (pin2){
                  pins[1] = pin2 ?? '';
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Roboto',
                  color: AppColors.but_black,
                  fontSize: 28,
                ),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 64,
              width: 64,
              child: TextFormField(
                onChanged: (value){
                  if(value?.length == 1){
                    FocusScope.of(context).nextFocus();
                  }
                },
                initialValue: '',
                onSaved: (pin3){
                  pins[2] = pin3 ?? '';
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Roboto',
                  color: AppColors.but_black,
                  fontSize: 28,
                ),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 64,
              width: 64,
              child: TextFormField(
                onChanged: (value){
                  if(value?.length == 1){
                    FocusScope.of(context).nextFocus();
                  }
                },
                initialValue: '',
                onSaved: (pin4){
                  pins[3] = pin4 ?? '';
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Roboto',
                  color: AppColors.but_black,
                  fontSize: 28,
                ),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
