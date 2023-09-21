import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_journal/models/login_provider_model.dart';
import 'package:young_journal/pages/auth/register_page.dart';
import 'package:young_journal/widgets/basic_button_widget.dart';
import 'package:young_journal/widgets/fade_textfield_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Consumer<LoginProvider>(
        builder: (context, data, _){
          return Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg04.png'), fit: BoxFit.cover
                )
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 0.1,
                sigmaY: 0.1,
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.05),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      width: size.width * 0.9,
                      height: size.height * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(24)),
                          gradient: LinearGradient(
                              colors: [
                                const Color(0xff206e84).withOpacity(0.6),
                                const Color(0xff206e84).withOpacity(0.0),
                                const Color(0xff206e84).withOpacity(0.6),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: const [0.2, 0.5, 0.6]
                          )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FadeTextFieldWidget(textEditingController: data.eMailController, hintText: 'Email'),
                          FadeTextFieldWidget(textEditingController: data.passwordController, hintText: 'Password'),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.1,),
                    BasicButtonWidget(
                      width: size.width * 0.9,
                        onTap: () => data.signIn(),
                        text: 'Sign in'),
                    SizedBox(height: size.height * 0.05,),
                    TextButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterPage()));
                        },
                        child: const Text('Register', style: TextStyle(color: Colors.white, fontSize: 34),)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
