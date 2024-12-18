
//import 'package:app_3/pages/setting.dart';
import 'package:app_3/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:app_3/home.dart';
import 'package:app_3/pages/aftersp.dart';
import 'package:app_3/pages/login.dart';
import 'package:app_3/pages/registerpage.dart';
import 'package:app_3/theme/light.dart';
import 'package:app_3/pages/playlist.dart';
import 'package:app_3/pages/create_playlist.dart';
import '../audio/filepicker.dart';
import 'components/recent.dart';
import 'components/search.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get song => null;

  
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
        "/playlist": (context) => PlaylistScreen( song: song,),
        "/create_playlist": (context) => Playlist(),
       // "/settings": (context) => SettingsScreen(),
        "/filepicker": (context) => MusicPlayerScreen(),
        "/search": (context) => SearchPage(),
        "/recent": (context) => HomeScreen()
      },
    );
  }
}






































































































































