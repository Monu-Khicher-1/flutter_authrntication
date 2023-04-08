import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:study_partner_teach/utils/Colors.dart';
import '/widgets/main_logo.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 80,),
          const Center(child: MainLogo()),
          const SizedBox(height: 60,),
          SvgPicture.asset('assets/sign_in_illustration.svg'),
          const SizedBox(height: 130,),
          Container(
            padding: const EdgeInsets.fromLTRB(35,0,35,16),
              width: 300,
              child: ElevatedButton(
                  onPressed: (){},
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
          Container(
            padding:  const EdgeInsets.fromLTRB(36,1,35,1),
            child: Text("Already have an account?",
              style: TextStyle(
                color: AppColors.txt_grey,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 14.8,
                letterSpacing: 0.46,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          Container(padding: const EdgeInsets.fromLTRB(35,2,35,10),
            child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  backgroundColor: AppColors.but_orange,
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
    );
  }
}
