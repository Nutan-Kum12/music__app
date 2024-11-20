import 'package:flutter/material.dart';

class FeaturingToday extends StatelessWidget {
  final List<Map<String, String>> featuringTodayList = [
    {'title': 'English Songs', 'image': 'assets/images/unsplash.png'},
    {'title': 'Top Hits', 'image': 'assets/images/unsplash.png'},
    {'title': 'Jazz Classics', 'image': 'assets/images/unsplash.png'},
    {'title': 'Jazz Classics', 'image': 'assets/images/unsplash.png'},
    {'title': 'Jazz Classics', 'image': 'assets/images/unsplash.png'},
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('Featuring Today',
           style: TextStyle(color: Colors.white,
            fontSize: MediaQuery.of(context).size.height * 0.025,
             fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: featuringTodayList.map((item) => _buildFeatureCard(item)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureCard(Map<String, String> item) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            // Background image
            Image.asset(
              item['image']!,
              width: 250,
              height: 150,
              fit: BoxFit.cover,
            ),
            // Text overlay
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                item['title']!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 3,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
