import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/FirebaseAuth.services.dart';
import 'package:flutter_application_1/Services/sharedPrfns.services.dart';
import 'package:flutter_application_1/views/Regpage.dart';
import 'package:flutter_application_1/views/homePage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:string_validator/string_validator.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController ReguserName = TextEditingController();
    TextEditingController ReguserEmail = TextEditingController();
    TextEditingController ReguserPassword = TextEditingController();

 final _formKey = GlobalKey<FormState>();

    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    
    FirebaseAuthServices _auth = FirebaseAuthServices();
    ShardprfnsServices _shrdd = ShardprfnsServices();
    void signIn() async {
      String email = ReguserEmail.text;
      String password = ReguserPassword.text;
      String userName = ReguserName.text;
      User? user = await _auth.SignInWithEmailAndPasword(email, password);
      if (user != null) {
        _shrdd.setValueInShed(userName);
        print("login sucessfull");
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Homepage();
        }));
      } else {
        print("error occured");
      }
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 242, 242),
      body: Form(
         key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenWidth * 0.15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth * 0.05,
                  ),
                  Text(
                    "MyNews Login Page",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.15,
              ),
              Center(
                child: SizedBox(
                  width: screenWidth * 0.9,
                  child: TextFormField(
                  
                    controller: ReguserName,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white38)),
                      fillColor: Color.fromARGB(255, 254, 254, 254),
                      filled: true,
                      labelText: "Name",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              SizedBox(
                width: screenWidth * 0.9,
                child: TextField(
                  controller: ReguserEmail,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(4),
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      filled: true,
                      labelText: "Email",
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              SizedBox(
                width: screenWidth * 0.9,
                child: TextField(
                  controller: ReguserPassword,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(4),
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      filled: true,
                      labelText: "Password",
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.35,
              ),
              GestureDetector(
                onTap: () {
                    if (_formKey.currentState!.validate()) {
                      signIn();
                    }
                    
                  
                },
                child: Container(
                  width: screenWidth * 0.60,
                  height: screenHeight * 0.055,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue),
                  child: Center(
                      child: Text(
                    "SignIn",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Colors.white),
                  )),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont have an account?"),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return Regpage();
                      }));
                    },
                    child: Text(
                      " Register",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
