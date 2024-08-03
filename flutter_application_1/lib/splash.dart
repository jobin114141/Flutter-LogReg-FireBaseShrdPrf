import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/homePage.dart';
import 'package:flutter_application_1/views/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("loged") ?? false; // Default to false if not set
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkLogin(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child:
                  CircularProgressIndicator()); // Loading indicator while checking login status
        } else {
          bool loggedIn = snapshot.data ?? false;
          return loggedIn
              ? Homepage()
              : Loginpage(); // Navigate based on login status
        }
      },
    );
  }
}
