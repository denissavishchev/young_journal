import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class LoginProvider with ChangeNotifier {

  final TextEditingController eMailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: eMailController.text.trim(),
        password: passwordController.text.trim()
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', eMailController.text.trim());
    email = prefs.getString('email')!;
  }

}