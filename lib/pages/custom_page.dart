import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/finance_provider_model.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<FinanceProvider>(
        builder: (context, data, _){
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 100,
                        right: 0,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.5,
                          color: Colors.transparent,
                        ),
                      ),
                      Positioned(
                        top: 130,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(110),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.8),
                                  blurRadius: 20,
                                  offset: const Offset(10, 10),
                                ),
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.2),
                                  blurRadius: 20,
                                  offset: const Offset(-10, -10),
                                ),
                              ]
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]
          );
        },
      ),
    );
  }
}