import 'package:flutter/material.dart';
import 'package:whoami/pages/home-page.dart';
import 'package:whoami/pages/mobile-unavailable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
Widget build(BuildContext context) {

  final width = MediaQuery.sizeOf(context).width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (width < 750) ? MobileUnavailable() : HomePage(),
    );

  //something goes here eventually
}
}