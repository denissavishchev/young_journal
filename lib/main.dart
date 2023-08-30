import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_journal/models/finance_provider_model.dart';
import 'package:young_journal/pages/home_page.dart';

import 'models/main_provider_model.dart';
import 'models/pets_provider_model.dart';
import 'models/plans_provider_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainProvider>(create: (_) => MainProvider()),
        ChangeNotifierProvider<FinanceProvider>(create: (_) => FinanceProvider()),
        ChangeNotifierProvider<PlansProvider>(create: (_) => PlansProvider()),
        ChangeNotifierProvider<PetsProvider>(create: (_) => PetsProvider()),
      ],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
    }, );
  }
}
