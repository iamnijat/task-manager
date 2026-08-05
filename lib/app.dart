import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_app/presentation/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        theme: ThemeData(primaryColor: Colors.pinkAccent),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen2(),
      );
    });
  }
}
