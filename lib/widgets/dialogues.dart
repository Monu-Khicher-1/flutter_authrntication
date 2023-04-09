

import 'package:flutter/material.dart';

class MyDialogues{
  static Future<bool?> showMyDialog(BuildContext context){ return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Do you want to leave.'),
        actions: [
          TextButton(
              onPressed: (){
                Navigator.pop(context,true);
              },
              child: Text("YES")),
          TextButton(
              onPressed: (){
                Navigator.pop(context,false);
              },
              child: Text("CANCEL")),
        ],
      )
  );
  }
}