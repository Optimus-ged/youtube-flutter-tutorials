import 'package:flutter/material.dart';
import 'package:landing_and_login_screen/pages/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: "Poppins"),
      home: const LandingPage(),
      //
    );
  }
}
