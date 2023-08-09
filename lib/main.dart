import 'package:flutter/material.dart';
import 'package:sushi_app/pages/intro_page.dart';
import 'package:sushi_app/pages/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => const MenuPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter App Sushi Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MenuPage(),
    );
  }
}
