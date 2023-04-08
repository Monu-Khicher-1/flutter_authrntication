import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study_partner_teach/utils/Colors.dart';
import 'package:study_partner_teach/widgets/main_logo.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
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
                          onSaved: (pin1){},
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
                          onSaved: (pin2){},
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
                          onSaved: (pin3){},
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
                          onSaved: (pin1){},
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
              ),
              Container(
                padding: EdgeInsets.all(20),
                width:120,
                child: ElevatedButton(
                    onPressed: (){},
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
    );
  }
}
