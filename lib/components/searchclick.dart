import 'package:flutter/material.dart';

class Searchclick extends StatelessWidget {
  final List<Map<String, String>> recentSearches = [
    {
      'title': 'You (feat. Travis Scott)',
      'subtitle': 'Song • Don Toliver',
      'image': 'assets/images/album1.png'
    },
    {
      'title': 'John Wick: Chapter 4 (Original Soundtrack)',
      'subtitle': 'Album • Tyler Bates, Joel J. Richard',
      'image': 'assets/images/album2.png'
    },
    {
      'title': 'Maroon 5',
      'subtitle': 'Artist',
      'image': 'assets/images/album3.png'
    },
    {
      'title': 'Phonk Madness',
      'subtitle': 'Playlist',
      'image': 'assets/images/peace.png'
    },
    {
      'title': 'Phonk Madness',
      'subtitle': 'Playlist',
      'image': 'assets/images/album1.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search songs, artist, album or playlist...',
                        hintStyle: TextStyle(color: Colors.white54),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        filled: true,
                        fillColor: Colors.grey[850],
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.redAccent, fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: recentSearches.length,
                itemBuilder: (context, index) {
                  final search = recentSearches[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[800],
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          search['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      search['title']!,
                      style: TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      search['subtitle']!,
                      style: TextStyle(color: Colors.white70),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        // Handle delete action here
                      },
                    ),
                  );
                },
              ),
            ),
            Divider(color: Colors.white24),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  // Handle clear history action
                },
                child: Text(
                  'Clear history',
                  style: TextStyle(color: Colors.redAccent, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
