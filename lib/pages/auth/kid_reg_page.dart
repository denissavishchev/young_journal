import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_journal/models/reg_provider_model.dart';
import 'package:young_journal/widgets/basic_button_widget.dart';
import 'package:young_journal/widgets/basic_container_widget.dart';

class KidRegPage extends StatelessWidget {
  const KidRegPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Consumer<RegProvider>(
        builder: (context, data, _){
          return Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg05.png'), fit: BoxFit.cover
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
                      height: size.height * 0.4,
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
                          BasicContainerWidget(
                            color: const Color(0xfff0c081),
                            height: 0.1,
                            child: TextField(
                              controller: data.eMailController,
                              cursorColor: Colors.white,
                              style: const TextStyle(fontSize: 28, color: Colors.white),
                              decoration: const InputDecoration(
                                  hintText: 'Mail',
                                  isCollapsed: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent)
                                  )
                              ),
                            ),),
                          BasicContainerWidget(
                            color: const Color(0xfff0c081),
                            height: 0.1,
                            child: TextField(
                              obscureText: true,
                              controller: data.passwordController,
                              cursorColor: Colors.white,
                              style: const TextStyle(fontSize: 28, color: Colors.white),
                              decoration: const InputDecoration(
                                  hintText: 'Password',
                                  isCollapsed: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent)
                                  )
                              ),
                            ),),
                          BasicContainerWidget(
                            color: const Color(0xfff0c081),
                            height: 0.1,
                            child: TextField(
                              obscureText: true,
                              controller: data.confirmPasswordController,
                              cursorColor: Colors.white,
                              style: const TextStyle(fontSize: 28, color: Colors.white),
                              decoration: const InputDecoration(
                                  isCollapsed: true,
                                  hintText: 'Confirm Password',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent)
                                  )
                              ),
                            ),),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.1,),
                    BasicButtonWidget(
                        width: size.width * 0.9,
                        onTap: () => data.register(),
                        text: 'Register'),

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
