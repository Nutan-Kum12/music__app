import 'package:flutter/material.dart';

class WorkPlaylist extends StatelessWidget {
  final List<Map<String, String>> songs = [
    {'title': 'Weightless', 'artist': 'Marconi Union', 'image': 'assets/images/mix2.png'},
    {'title': 'Nothing It Can', 'artist': 'Helios', 'image': 'assets/images/peace.png'},
    {'title': 'Eye of the Tiger', 'artist': 'Survivor', 'image': 'assets/images/young.png'},
    {'title': 'Remember the Name ', 'artist': 'Fort Monk', 'image': 'assets/images/indie.png'},
    {'title': 'Nothing It Can', 'artist': 'Lyle Mays', 'image': 'assets/images/young.png'},
    {'title': 'Run the World (Girls)', 'artist': 'Beyoncé', 'image': 'assets/images/peace.png'},
    {'title': 'Fire Work', 'artist': 'Caty Pary', 'image': 'assets/images/mix2.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return 
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Playlist Header
          Padding(
            padding: const EdgeInsets.only(top: 12.0,left: 14,right: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Album Cover
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/mix2.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 16),
                // Playlist Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Workout Boost',
                        style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '28 songs',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          // Play Button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(16),
                            ),
                            onPressed: () {},
                            child: Icon(Icons.play_arrow, color: Colors.white, size: 28),
                          ),
                          const SizedBox(width: 16),
                          // Favorite Icon
                          IconButton(
                            onPressed: () {},
                            icon:  Icon(Icons.favorite_border, color: Colors.white),
                          ),
                          // More Options
                          IconButton(
                            onPressed: () {},
                            icon:  Icon(Icons.more_vert, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Song List
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(songs[index]['image']!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  title: Text(
                    songs[index]['title']!,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  subtitle: Text(
                    songs[index]['artist']!,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                  ),
                );
              },
            ),
          ),
          // "See All" Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'See All',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      );
  }
}
