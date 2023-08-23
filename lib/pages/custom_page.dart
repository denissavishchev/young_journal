import 'package:flutter/material.dart';
import 'package:young_journal/constants.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      body: Center(
          child: Text('CustomPage')
      ),
    );
  }
}