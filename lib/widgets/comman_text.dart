import 'package:flutter/material.dart';
import 'package:study_partner_teach/utils/Colors.dart';

class Text1 extends StatefulWidget {
  const Text1({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<Text1> createState() => _Text1State();
}

class _Text1State extends State<Text1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Text(
        widget.text,
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontFamily: 'Roboto',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.08,
          color: AppColors.but_orange,
        ),
      ),
    );
  }
}

class Text2 extends StatefulWidget {
  const Text2({Key? key,required this.text}) : super(key: key);
  final String text;
  @override
  State<Text2> createState() => _Text2State();
}

class _Text2State extends State<Text2> {
  @override
  Widget build(BuildContext context) {
    final Size size =MediaQuery.of(context).size;
    return Container(
      // color: Colors.grey,
      width: size.width,
      padding: EdgeInsets.fromLTRB(35, 4,4,4),
      child: Text(
        widget.text,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          fontFamily: 'Roboto',
          fontSize: 20,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.48,
          color: AppColors.but_orange,
        ),
      ),
    );
  }
}

class Text3 extends StatefulWidget {
  const Text3({Key? key,required this.text}) : super(key: key);
  final String text;
  @override
  State<Text3> createState() => _Text3State();
}

class _Text3State extends State<Text3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Text(
        widget.text,
        style: TextStyle(
          color: AppColors.txt_grey,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          fontSize: 14.8,
          letterSpacing: 0.46,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }
}


