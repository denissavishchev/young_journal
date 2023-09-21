import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class RegProvider with ChangeNotifier {

  bool elder = true;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController relationController = TextEditingController();
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
    await FirebaseFirestore.instance
        .collection('users')
        .doc(eMailController.text.trim())
        .set({
      'name': nameController.text.trim(),
      'surname': surnameController.text.trim(),
      'relation': relationController.text.trim(),
      'email': eMailController.text.trim(),
      'kid': elder ? 'n' : 'y',
        });

  }

  bool confirmedPassword(){
    if(passwordController.text.trim() == confirmPasswordController.text.trim()){
      return true;
    }else{
      return false;
    }
  }

  void switchRole(){
    elder = !elder;
    notifyListeners();
  }


}