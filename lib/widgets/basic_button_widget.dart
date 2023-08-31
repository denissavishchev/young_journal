import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class BasicButtonWidget extends StatelessWidget {
  const BasicButtonWidget({
    super.key, required this.onTap, required this.text,
  });

  final Function() onTap;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, data, _){
          return GestureDetector(
            onTap: onTap,
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                  color: kOrange,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: kBlue,
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(1, 1),
                    )
                  ]),
              child: Center(child: Text(text, style: TextStyle(fontSize: 42),)),
            ),
          );
        });
  }
}