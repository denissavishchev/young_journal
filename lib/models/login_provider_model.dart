import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {

  final TextEditingController eMailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: eMailController.text.trim(),
        password: passwordController.text.trim()
    );
  }

}