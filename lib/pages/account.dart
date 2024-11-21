import 'package:app_3/appwrite/appwritecontrollers.dart';
import 'package:app_3/pages/delete.dart';
import 'package:app_3/pages/updatepass.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container
            (
               child: ElevatedButton(
                    onPressed: () {
                      logoutUser();
                      Navigator.pushReplacementNamed(context, "/login");
                    },
                    child: Text("Logout"))
            ),
            SizedBox(height: 14,),
             Container
             (
               child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdatePasswordPage(client: client)));
                    },
                    child: Text("Update Password"))
            ),
             Container
             (
               child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DeleteAccountPage(client: client)));
                    },
                    child: Text("Delete Account"))
            ),
          ],
        ),
      ),
    );
  }
}