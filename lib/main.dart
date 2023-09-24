import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:landing_and_login_screen/presentation/posts/posts_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.grey.shade100,
        systemNavigationBarIconBrightness: Brightness.dark
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        highlightColor: Colors.black,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const PostsView(),
    );
  }
}