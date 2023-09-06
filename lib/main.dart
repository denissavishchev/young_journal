import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:young_journal/models/finance_provider_model.dart';
import 'package:young_journal/pages/auth/auth_page.dart';
import 'models/login_provider_model.dart';
import 'models/home_provider_model.dart';
import 'models/pets_provider_model.dart';
import 'models/plans_provider_model.dart';
import 'models/reg_provider_model.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
        ChangeNotifierProvider<RegProvider>(create: (_) => RegProvider()),
      ],
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: AuthPage(),
          );
    }, );
  }
}
