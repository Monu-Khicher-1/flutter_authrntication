import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/Colors.dart';
import '../utils/utils.dart';

class OtpNewPage extends StatefulWidget {
  const OtpNewPage({super.key});

  @override
  State<OtpNewPage> createState() => _OtpNewPageState();
}

class _OtpNewPageState extends State<OtpNewPage> {

  /// [FocusNode] for [RawKeyboardListener]
  final FocusNode focusNode = FocusNode();

  ///number input checker list for [RawKeyboardListener]
  List<String> keyboard = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];

  //current focussed index of otp fields
  int index = 0;
  final List<TextEditingController> controllers =
  List.generate(6, (index) => TextEditingController());

  void verifyOtp()async{
    /// otp verification callback here
    Utility.customSnackBar(context: context, message: "OTP verified. Signup successfully!");
    Navigator.pushNamedAndRemoveUntil(context, '/home',(route) => false);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RawKeyboardListener(
                    focusNode: focusNode,
                    onKey: (event) {
                      /// triggers when the user presses the button
                      if (event is RawKeyDownEvent) {
                        if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
                          verifyOtp();
                          return;
                        } else if (event.isKeyPressed(LogicalKeyboardKey.backspace)) {
                          backspaceCallback();
                          return;
                        }
                        final key = event.logicalKey.keyLabel;
                        if (keyboard.contains(key)) {
                          keyPressCallback(key);
                        }
                      }
                    },
                    child:Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(6, (index) => buildTextField(index))))),
    );
  }
    Widget buildTextField(int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: this.index == index ? Colors.black : Colors.grey, width: this.index == index ? 1.6 : 1.4),
          borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      height: 40,
      width: 38,
      margin: EdgeInsets.only(left: (index == 0) ? 0.0 : 3.6, right: 3.6),
      child: TextField(
        onTap: () => setState(() {
          this.index = index;
        }),
        autofocus: index== 0,
        enableSuggestions: true,
        enableInteractiveSelection: false,
        textAlign: TextAlign.center,
        maxLength: 1,
        showCursor: false,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 1.5),
        controller: controllers[index],
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(left: 3),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            counterText: "",
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
    }

  /// handling the backpresses to clear the text in a otp cell 
  /// or move to previous cell if empty
  backspaceCallback() {
    if (controllers[index].text.isNotEmpty) {
      controllers[index].text = "";
    } else if (index != 0) {
      index--;
      controllers[index].text = "";
    }
    setState(() {});
  }

  keyPressCallback(String key) {
    controllers[index].text = key;
    index++;
    /// unfocus the keyboard when all the fields are inputted
    if (index == 6) {
      focusNode.unfocus();
    }
    setState(() {});
  }

}