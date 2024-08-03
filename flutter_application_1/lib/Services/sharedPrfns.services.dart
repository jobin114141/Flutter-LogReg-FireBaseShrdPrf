import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class ShardprfnsServices{
 void setValueInShed(userName) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", userName);
    prefs.setBool("loged", true);
  }
}