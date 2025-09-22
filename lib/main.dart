//import 'dart:nativewrappers/_internal/vm/bin/vmservice_io.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rosalia_sprints/sign_in.dart';
import 'package:rosalia_sprints/sign_up.dart';
import 'package:rosalia_sprints/welcome.dart';
import 'package:rosalia_sprints/home.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/lang', // <-- change the path of the translation files 
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
  fontFamily: 'Suwannaphum',
  ),
      home: const Welcome(),
      routes: {
  '/sign_in': (context) => sign_in(),
  '/sign_up': (context) => sign_up(),
  '/welcome': (context) => Welcome(), 
  '/home': (context) => home(),  
      }
    );
  }
}