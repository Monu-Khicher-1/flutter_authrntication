

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_partner_teach/entities/user.dart';

class SharedPrefs{
  SharedPrefs();
  User user = User.empty;
  Future<bool> isLoggedIn() async{
    return true;
  }
  Future<bool> saveUser(User user) async{
    return true;
  }
}