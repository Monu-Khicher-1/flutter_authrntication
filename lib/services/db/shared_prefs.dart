

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_partner_teach/entities/user.dart';

class SharedPrefs{
  SharedPrefs();
  User user = User.empty;
  Future<bool> isLoggedIn() async{
    final  preferences = await SharedPreferences.getInstance();
    String userStr = preferences.getString("user") ?? "";
    if(userStr.length==0){
      return false;
    }
    var jsonObj = jsonDecode(userStr);
    this.user=User(name: jsonObj['name'], phoneNumber: jsonObj['phoneNumber']);
    return true;
  }
  Future<bool> saveUser(User user) async{
    final  preferences = await SharedPreferences.getInstance();
    var _user = {};
    _user['name'] = user.name;
    _user['phoneNumber']=user.phoneNumber;
    String jsonStr = jsonEncode(_user);
    preferences.setString('user',jsonStr);
    print("Successfully saved data.");
    return true;
  }
}