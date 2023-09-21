import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:young_journal/pages/auth/auth_page.dart';
import '../models/home_provider_model.dart';
import '../widgets/bottom_nav_bar_widget.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final initData = Provider.of<MainProvider>(context, listen: false);
    initData.initPage();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<MainProvider>(builder: (context, data, _){
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg08.png'), fit: BoxFit.cover
            )
          ),
          child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 0.1,
                sigmaY: 0.1,
              ),
            child: Stack(
              children: [
                PageView.builder(
                    controller: data.mainPageController,
                    onPageChanged: (int index) => data.changePage(index),
                    itemCount: data.pages.length,
                    itemBuilder: (context, index) {
                      return data.pages[index % data.pages.length];
                    }),
                const BottomNavBarWidget(),
                Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.remove('email');
                        FirebaseAuth.instance.signOut().then((value) =>
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const AuthPage())));
                      } ,
                      icon: const Icon(Icons.logout, color: Colors.white,),
                    )),
              ],
            ),
          ),
        );
      })
    );
  }
}


