import 'package:flutter/material.dart';

class EditorsPicksSection extends StatelessWidget {
  final List<Map<String, String>> editorsPicks = [
    {'title': 'Ed Sheeran', 'imageUrl': 'assets/images/edit2.png'},
    {'title': 'Mitski', 'imageUrl': 'assets/images/edit1.png'},
    {'title': 'Charli XC', 'imageUrl': 'assets/images/edit2.png'},
    {'title': 'Tame Impala', 'imageUrl': 'assets/images/edit1.png'},
    {'title': 'Charli XC', 'imageUrl': 'assets/images/album3.png'},
    {'title': 'Charli XC', 'imageUrl': 'assets/images/album3.png'},
    {'title': 'Charli XC', 'imageUrl': 'assets/images/album3.png'},
    {'title': 'Charli XC', 'imageUrl': 'assets/images/album3.png'},
    {'title': 'Charli XC', 'imageUrl': 'assets/images/album3.png'},
    {'title': 'Charli XC', 'imageUrl': 'assets/images/album3.png'},
    // Add more items here
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Editor\'s picks',
          style: TextStyle(color: Colors.white,
           fontSize:  MediaQuery.of(context).size.height * 0.025,
           fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Container(
          height: MediaQuery.of(context).size.height * 0.23 ,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: editorsPicks.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: MediaQuery.of(context).size.height * 0.14,
                    height: MediaQuery.of(context).size.height * 0.12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(editorsPicks[index]['imageUrl']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height * 0.02 ),
                  Text(
                    editorsPicks[index]['title']!,
                    style: TextStyle(color: Colors.grey, 
                    fontSize:  MediaQuery.of(context).size.height * 0.02),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
