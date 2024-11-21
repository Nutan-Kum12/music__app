import 'package:app_3/pages/delete.dart';
import 'package:app_3/pages/updatepass.dart';
import 'package:flutter/material.dart';
import 'package:app_3/appwrite/appwritecontrollers.dart';
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.orange),
        onPressed: () {
        Navigator.pop(context);
        },
        ),
        actions: [
        IconButton(
        icon: Icon(Icons.edit, color: Colors.white),
        onPressed: () {//edit
        },
        ),
        ],
      ),


      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            CircleAvatar(
              radius: 50,
              child: Image.asset("assets/images/logan.png"),
            ),
            SizedBox(height: 16),

            Text(
              'Logan Jimmy',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16,),
            Row(
              children: [
                Text(
                  'Email',
                  style: TextStyle(color: Colors.grey),
                ),
                Spacer(),
                Text(
                  'jim_logan01@gmail.com',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 8),

            Row(
              children: [
                Text(
                  'Phone Number',
                  style: TextStyle(color: Colors.grey),
                ),
                Spacer(),
                Text(
                  '8844662200',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileStat('120 songs', Icons.favorite),
                ProfileStat('12 playlists', Icons.queue_music),
                ProfileStat('3 artists', Icons.person),
              ],
            ),
            SizedBox(height: 24),
            Divider(color: Colors.grey),
            SizedBox(height: 24),

            Row(
              children: [
                Text(
                  'Settings',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Music Languages
            Row(
              children: [
                Text(
                  'Music Language(s)',
                  style: TextStyle(color: Colors.grey),
                ),
                Spacer(),
                Text(
                  'English, Tamil',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 8),

            Row(
              children: [
                Text(
                  'Streaming Quality',
                  style: TextStyle(color: Colors.grey),
                ),
                Spacer(),
                Text(
                  'HD',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
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
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.black,
      //   unselectedItemColor: Colors.grey,
      //   selectedItemColor: Colors.white,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      //     BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'Your Library'),
      //   ],
      // ),
    );
  }
}

class ProfileStat extends StatelessWidget {
  final String label;
  final IconData icon;

  ProfileStat(this.label, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }
}
