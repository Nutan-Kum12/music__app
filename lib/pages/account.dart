import 'package:app_3/appwrite/appwritecontrollers.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container
      (
            child: ElevatedButton(
                      onPressed: () {
                        logoutUser();
                        Navigator.pushReplacementNamed(context, "/login");
                      },
                      child: Text("Logout"))
      ),
    );
  }
}