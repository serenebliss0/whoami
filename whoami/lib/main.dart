import 'package:flutter/material.dart';
import 'package:whoami/pages/home-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'whoami · Semire',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFF8F5FF),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF6B9D)),
      ),
      home: const HomePage(),
    );
  }
}
