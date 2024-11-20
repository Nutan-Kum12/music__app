import 'package:flutter/material.dart';
import 'package:app_3/home.dart';
import 'package:app_3/pages/login.dart';
import 'package:app_3/pages/registerpage.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: Image.asset("assets/images/music.jpg",fit: BoxFit.cover,),
              
            ),
            Column( 
            children: [
            // Spotify Logo
            // SizedBox(height: MediaQuery.of(context).size.height * 0.01,),    
              Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: double.infinity,
                child: Image.asset("assets/images/splas.png",scale:0.4,),
              ),
            ),
            
            // Title Text
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Text(
                    'Millions of Songs.',
                    style: TextStyle(
                      fontSize:  MediaQuery.of(context).size.height * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Free on Musico..',
                    style: TextStyle(
                      fontSize:  MediaQuery.of(context).size.height * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
             SizedBox(height:  MediaQuery.of(context).size.height * 0.02),
            
            // Sign Up Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Colors.orange,
                  minimumSize:  Size(double.infinity, MediaQuery.of(context).size.height * 0.08 ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child:  Text(
                  'Sign up free',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            SizedBox(height:MediaQuery.of(context).size.height * 0.02),
            
            // Social Login Buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  socialButton(
                    context,
                    'Continue with Google',
                    Icons.g_mobiledata,
                    onPressed: () {},
                  ),
                   SizedBox(height: MediaQuery.of(context).size.height * 0.017),
                  socialButton(
                    context,
                    'Continue with Facebook',
                    Icons.facebook,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>Homepage()));
                    },
                  ),
                
                ],
              ),
            ),
            
             SizedBox(height:MediaQuery.of(context).size.height * 0.02),
            
            // Log In Link
            TextButton(
              onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              },
              child: Text(
                'Log in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                ),
              ),
            ),
            
             SizedBox(height:  MediaQuery.of(context).size.height * 0.02),
          ],
          )
          ],
        ),
      ),
    );
  }

  Widget socialButton(BuildContext context,String text, IconData icon, {required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      height:  MediaQuery.of(context).size.height * 0.09,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        icon: Icon(icon, color: Colors.white),
        label: Text(
          text,
          style:TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.height * 0.020,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}