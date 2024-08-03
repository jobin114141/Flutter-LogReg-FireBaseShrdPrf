import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Services/FirebaseAuth.services.dart';
import 'package:flutter_application_1/views/loginPage.dart';

class Regpage extends StatelessWidget {
  const Regpage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController ReguserNamee = TextEditingController();
    TextEditingController ReguserEmail = TextEditingController();
    TextEditingController ReguserPassword = TextEditingController();

    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    final _FormKey = GlobalKey<FormState>();
    final FirebaseAuthServices _auth = FirebaseAuthServices();

    void _signup() async {
      String username = ReguserNamee.text;
      String email = ReguserEmail.text;
      String password = ReguserPassword.text;
      User? user = await _auth.SignUpWithEmailAndPasword(email, password);

      if (user != null) {
        _auth.SaveuserDetails(username,email,user);
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Loginpage();
        }));
      } else {
        print("some error occured");
      }
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 242, 242),
      body: Form(
        key: _FormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.06,
              ),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.05,
                  ),
                  Text(
                    "MyNews Registration Page",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.2,
              ),
              Center(
                child: SizedBox(
                  width: screenWidth * 0.9,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter User Name";
                      } else {
                        return null;
                      }
                    },
                    controller: ReguserNamee,
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
              Center(
                child: SizedBox(
                    width: screenWidth * 0.9,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter User Name";
                        } else {
                          return null;
                        }
                      },
                      controller: ReguserEmail,
                      decoration: InputDecoration(
                          labelText: "Email",
                          fillColor: Color.fromARGB(255, 254, 254, 254),
                          filled: true,
                          contentPadding: EdgeInsets.all(4),
                          enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(0, 255, 253, 253)))),
                    )),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Center(
                child: SizedBox(
                  width: screenWidth * 0.9,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter User Name";
                      } else {
                        return null;
                      }
                    },
                    controller: ReguserPassword,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(4),
                        labelText: "Password",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.4,
              ),
              InkWell(
                onTap: () {
                  if (_FormKey.currentState!.validate()) {
                    _signup();
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
                    "SignUp",
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
                  Text("Already have an account?"),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return Loginpage();
                      }));
                    },
                    child: Text(
                      " Login",
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
