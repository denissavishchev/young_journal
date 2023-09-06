import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_journal/widgets/glass_morph_widget.dart';
import '../models/home_provider_model.dart';


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
              image: AssetImage('assets/images/bg02.png'), fit: BoxFit.cover
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
                Positioned(
                  bottom: 20,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        data.pages.length, (index) =>
                          GestureDetector(
                            onTap: (){
                              data.mainPageController.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                            child: Container(
                                width: 60,
                                height: 60,
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                ),
                                child: GlassMorphWidget(
                                  opacity: data.activePage == index ? 0.8 : 0.13,
                                  color: Colors.white,
                                  opacityL: 0.5,
                                  opacityR: 0.15,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                      child: Image.asset('assets/images/${data.icons[index]}.png')),)
                            ),
                          ),
                      ),
                    ),
                  ),
                ),
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
