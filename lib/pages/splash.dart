import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:task_3/pages/login.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:2), () {
      if (mounted) { 
        Navigator.pushReplacementNamed(context, "/loginscreen");  
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Musico',style: TextStyle(
              fontSize: 28
            ),),
           Container(
             height:screenHeight*0.3,
             width: screenWidth*0.2,
             child: Image.asset(
            "assets/images/splas.png",
            // fit: BoxFit.cover,
          ),
        ),
          ],
        ),
      ),
    );
  }
}
