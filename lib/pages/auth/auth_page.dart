import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:young_journal/pages/auth/login_page.dart';
import 'package:young_journal/pages/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return const HomePage();
          }else{
            return const LoginPage();
          }
        },
      ),
    );
  }
}
