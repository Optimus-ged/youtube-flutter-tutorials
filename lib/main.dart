import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landing_and_login_screen/business_logic/cubits/post_data/posts_data_cubit.dart';
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
          systemNavigationBarIconBrightness: Brightness.dark),
    );
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PostsDataCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Poppins",
            highlightColor: Colors.black,
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: const PostsView(),
        ));
  }
}
