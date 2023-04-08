import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainLogo extends StatefulWidget {
  const MainLogo({Key? key}) : super(key: key);
  @override
  State<MainLogo> createState() => _MainLogoState();
}

class _MainLogoState extends State<MainLogo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(padding: const EdgeInsets.all(3),child: SvgPicture.asset("assets/main_logo.svg",width: 37,)),
              const Padding(
                padding: EdgeInsets.fromLTRB(3, 5, 5,7.5),
                child: Text("TEACH",
                  style: TextStyle(
                    letterSpacing: 0.28,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(5, 1, 6, 3),
            child: Text("Your Study Partner",
                style: TextStyle(
                  letterSpacing: 0.08,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 12.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
