import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:young_journal/main.dart';

class SettingsProvider with ChangeNotifier {

  final TextEditingController requestController = TextEditingController();

  String name = '';
  String surname = '';
  String relation = '';

  Future<void> checkEmail() async {
      final list = await FirebaseAuth.instance.fetchSignInMethodsForEmail(
          requestController.text.trim());
      if (list.isNotEmpty) {
        var request = await FirebaseFirestore.instance.collection("users").get();
        for( var values in request.docs){
          if(values.data().containsValue(email)){
            name = values.data()['name'];
            surname = values.data()['surname'];
            relation = values.data()['relation'];
          }
        }
        await FirebaseFirestore.instance
            .collection('requests')
            .doc(requestController.text.trim())
            .set({
          'accepted': 'false',
          'name': name,
          'surname': surname,
          'relation': relation,
        });

      } else {
        print('This email does`t exist');

      }
  }

}