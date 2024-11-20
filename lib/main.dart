
import 'package:app_3/pages/splash.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:app_3/appwrite/appwritecontrollers.dart';
import 'package:app_3/home.dart';
import 'package:app_3/pages/aftersp.dart';
import 'package:app_3/pages/login.dart';
import 'package:app_3/pages/registerpage.dart';
import 'package:app_3/pages/splash.dart';
import 'package:app_3/theme/light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task_3',
      theme: lightMode,
      routes: {
        "/": (context) =>  SplashScreen(),
        // "/checkSession": (context) => CheckSession(),  
        "/loginscreen": (context) => LoginScreen(),  
        "/home": (context) =>  Homepage(),
        "/signup": (context) =>  SignUpPage(),
        "/login": (context) =>  LoginPage(),
      },
    );
  }
}






































































































































