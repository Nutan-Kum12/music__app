import 'package:app_3/pages/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app_3/components/editpick.dart';
import 'package:app_3/components/notification.dart';
import 'package:app_3/audio/filepicker.dart';
import 'package:app_3/pages/mix.dart';
import 'package:app_3/pages/today.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<int> recentlyPlayedIndices = [];
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          _buildHeader(screenWidth),
          Center(child: _buildTabBar()), // Updated line to center the TabBar
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildForYouTab(),
                _buildRelaxTab(),
                _buildWorkoutTab(),
                _buildTravelTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 8, right: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Hi Logan,\nGood Evening",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));
            },
          ),
          SizedBox(width: 10),
          InkWell(
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/peace.png"),
            ),
            onTap:()
            { Navigator.push(context,MaterialPageRoute(builder: (context)=>AccountPage()),);}
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.orange,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.white,
          labelStyle: TextStyle(fontSize:22, fontWeight: FontWeight.bold), // Increased font size
          unselectedLabelStyle: TextStyle(fontSize:18), // Increased font size for unselected tabs
          indicatorWeight: 3, // Makes the indicator line thicker
          tabs:  [
            Tab(text: "For You"),
            Tab(text: "Relax"),
            Tab(text: "Workout"),
            Tab(text: "Travel"),
          ],
        ),
      ),
    );
  }

  Widget _buildForYouTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FeaturingToday(),
            SizedBox(height: 10),
            MixesForYou(),
            SizedBox(height: 10),
            EditorsPicksSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildRelaxTab() {
    return Center(child: Text("Relax Content", style: TextStyle(color: Colors.white)));
  }

  Widget _buildWorkoutTab() {
    return Center(child: Text("Workout Content", style: TextStyle(color: Colors.white)));
  }

  Widget _buildTravelTab() {
    return Center(child: Text("Travel Content", style: TextStyle(color: Colors.white)));
  }
}