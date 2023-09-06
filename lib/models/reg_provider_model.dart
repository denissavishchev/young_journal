import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class RegProvider with ChangeNotifier {

  final TextEditingController eMailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Future register() async {
    if(confirmedPassword()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: eMailController.text.trim(),
          password: passwordController.text.trim()
      );
    }
  }

  bool confirmedPassword(){
    if(passwordController.text.trim() == confirmPasswordController.text.trim()){
      return true;
    }else{
      return false;
    }
  }
}