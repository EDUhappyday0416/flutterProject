import 'package:flutter/material.dart';
import 'package:flutter_project/screens/intro_screen.dart';

void main () {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"FruitShop",
      home:IntroScreen(),
    );
  }
}