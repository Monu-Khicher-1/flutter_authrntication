import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainMenuBar extends StatefulWidget {
  const MainMenuBar({Key? key}) : super(key: key);

  @override
  State<MainMenuBar> createState() => _MainMenuBarState();
}

class _MainMenuBarState extends State<MainMenuBar> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){},
      icon: SvgPicture.asset('assets/nav_bar.svg',width: 38,),
      iconSize: 40,
        // child: SvgPicture.asset('assets/nav_bar.svg'),
      // style: TextButton.styleFrom(
      //  
      // ),
    );
  }
}
