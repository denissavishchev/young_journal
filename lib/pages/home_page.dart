import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/home_provider_model.dart';
import '../widgets/bottom_nav_bar_widget.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () => FirebaseAuth.instance.signOut(),
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


