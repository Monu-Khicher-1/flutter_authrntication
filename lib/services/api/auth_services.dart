

// import 'dart:html';

import 'package:study_partner_teach/entities/user.dart';


class MockAuthService{
  @override
  Future<bool> logIn(User user) async{
    print("Recieved: ${user.phoneNumber}");
    var delayedVal = await Future.delayed(
      const Duration(seconds: 2),
          () => true,
    );
    return delayedVal;
    // TODO: implement logIn
    // throw UnimplementedError();
  }

  @override
  Future<bool> signUp(User user) async{
    // TODO: implement signUp
    // throw UnimplementedError();
    var delayedVal = await Future.delayed(
      const Duration(seconds: 2),
          () => true,
    );
    return delayedVal;
  }

  @override
  Future<bool> verifyOtp() async {
    // TODO: implement verifyOtp
    // throw UnimplementedError();
    var delayedVal = await Future.delayed(
      const Duration(seconds: 2),
          () => true,
    );
    return delayedVal;
  }

}