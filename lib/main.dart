import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_journal/pages/home_page.dart';

import 'models/main_provider_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Data(),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
    });
  }
}
