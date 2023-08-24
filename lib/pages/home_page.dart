import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_journal/constants.dart';
import 'package:young_journal/pages/pet_page.dart';
import 'package:young_journal/pages/plans_page.dart';
import '../models/main_provider_model.dart';
import 'custom_page.dart';
import 'finance_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  
  final List _pages = [
    const FinancePage(),
    const PlansPage(),
    const PetPage(),
    const CustomPage(),
  ];

  final List _icons = ['hand', 'task', 'pet', 'serves'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<Data>(builder: (context, data, _){
        return Stack(
          children: [
            PageView.builder(
                controller: data.mainPageController,
                onPageChanged: (int index) => data.changePage(index),
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _pages[index % _pages.length];
                }),
            Positioned(
              bottom: 20,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    _pages.length, (index) =>
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
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            padding: EdgeInsets.all(data.activePage == index ? 3 : 18),
                            decoration: const BoxDecoration(
                                color: grey,
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 5,
                                      offset: Offset(-3, -3)
                                  ),
                                  BoxShadow(
                                      color: grey,
                                      blurRadius: 5,
                                      offset: Offset(3, 3)
                                  ),
                                ]
                            ),
                            child: data.activePage == index
                                ? Container(
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(color: grey, blurRadius: 1, spreadRadius: 0),
                                  BoxShadow(color: Colors.white, blurRadius: 20, spreadRadius: 5),
                                ],
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                                color: grey,
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    grey,
                                    Colors.white,
                                  ],
                                ),
                              ),
                              child: Image.asset('assets/images/${_icons[index]}.png'),
                            )
                                : Image.asset('assets/images/${_icons[index]}.png')
                        ),
                      ),
                  ),
                ),
              ),
            )
          ],
        );
      })
    );
  }
}
