import 'package:app_3/components/Workplaylist.dart';
import 'package:app_3/components/playlist.dart';
import 'package:app_3/components/recentp.dart';
import 'package:app_3/components/travelPlaylist.dart';
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
  late TabController tabController;
  List<int> recentlyPlayedIndices = [];
  
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
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
          buildHeader(screenWidth),
          Center(child: buildTabBar()), 
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                buildForYouTab(),
                buildRelaxTab(),
                buildWorkoutTab(),
                buildTravelTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeader(double screenWidth) {
    return Padding(
      padding:  EdgeInsets.only(top: 40.0, left: 8, right: 8),
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

  Widget buildTabBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TabBar(
          controller: tabController,
          isScrollable: true,
          indicatorColor: Colors.orange,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.white,
          labelStyle: TextStyle(fontSize:22, fontWeight: FontWeight.bold), 
          unselectedLabelStyle: TextStyle(fontSize:18), 
          indicatorWeight: 3, 
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

  Widget buildForYouTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            FeaturingToday(),
            SizedBox(height: 10),
            MixesForYou(),
            SizedBox(height: 10),
            RecentlySection(),
            EditorsPicksSection(),
          ],
        ),
      ),
    );
  }

  Widget buildRelaxTab() {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(padding: EdgeInsets.all(8),
    child: PlaylistScreen(),
    );
  }
  Widget buildWorkoutTab(){
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(padding: EdgeInsets.all(8),
    child:Workplaylist(),
    );
  }
  Widget buildTravelTab() {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Padding(padding: EdgeInsets.all(8),
    child: TravelPlaylist(),
    );
  }
}