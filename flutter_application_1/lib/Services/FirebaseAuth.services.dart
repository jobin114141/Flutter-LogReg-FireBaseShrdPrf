import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> SignUpWithEmailAndPasword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (credential.user != null) {}

      return credential.user;
    } catch (e) {
      print("some Error occured");
    }
  }

  Future<User?> SignInWithEmailAndPasword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("some Error occured");
    }
  }

  Future<void> SaveuserDetails(username, email, user) async {
    print(user?.uid);
    await FirebaseFirestore.instance
        .collection("UserDetails")
        .doc(user?.uid)
        .set({"userName": username, "email": email});
  }
}
