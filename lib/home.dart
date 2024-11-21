
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:app_3/appwrite/appwritecontrollers.dart';
import 'package:app_3/audio/filepicker.dart';
import 'package:app_3/components/recent.dart';
import 'package:app_3/components/search.dart';

class Homepage extends StatefulWidget {
   Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  User? _currentUser;
  bool isLoading = true;
  int currentIndex = 0; 

  final List<Widget> pages = [
        HomeScreen(),
        SearchPage(),
        MusicPlayerScreen()
  ];
  @override
  void initState() {
    super.initState();
    getUser().then((value) {
      setState(() {
        _currentUser = value;
        isLoading = false;
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:isLoading
          ? Center(child: CircularProgressIndicator())
          : IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex:currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index; 
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted_outlined),
            label: 'Library',
          ),
        ],
      ),
    );
  }
}
