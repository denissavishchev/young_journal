import 'package:flutter/material.dart';

import '../constants.dart';

class BasicContainerWidget extends StatelessWidget {
  const BasicContainerWidget({super.key,
    required this.height,
    required this.color,
    required this.child,});

  final double height;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(12),
      width: size.width,
      height: size.height * height,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          boxShadow: const[
            BoxShadow(
              color: blue,
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(2, 2),
            )
          ]
      ),
      child: child,
    );
  }
}