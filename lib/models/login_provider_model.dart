import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:young_journal/pages/auth/kid_reg_page.dart';
import 'package:young_journal/widgets/basic_button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

late SharedPreferences prefs;

class LoginProvider with ChangeNotifier {

  final TextEditingController eMailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: eMailController.text.trim(),
        password: passwordController.text.trim()
    );
    prefs = await SharedPreferences.getInstance();
    prefs.setString('email', eMailController.text.trim());
    var email = prefs.getString('email');
    print('email $email');
  }

  Future elderOrKid(context) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 250),
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: const BoxDecoration(
                color: kGrey,
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    BasicButtonWidget(
                      width: 150,
                        height: 100,
                        onTap: (){},
                        text: 'As Elder'),
                    BasicButtonWidget(
                      width: 150,
                        height: 100,
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const KidRegPage()));
                        },
                        text: 'As Kid'),
                  ],
                ),
              ],
            ),
          );
        });
  }

}