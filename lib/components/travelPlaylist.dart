
import 'package:app_3/components/travelPlay.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


class Song {
  final String title;
  final String artist;
  final String asset;
  final String imageAsset;
  bool isFavorite;

  Song({
    required this.title,
    required this.artist,
    required this.asset,
    required this.imageAsset,
    this.isFavorite = false,
  });
}

class TravelPlaylist extends StatefulWidget {
  TravelPlaylist ({Key?key}):super(key:key );
  @override
   _TravelPlaylistState createState() => _TravelPlaylistState();
}

class _TravelPlaylistState extends State<TravelPlaylist> {
  final AudioPlayer audioPlayer =AudioPlayer();
  List <Song> songs =[
 Song(
      title: "Trek upio",
      artist: "Artist 1",
      asset: "audio/song1.mp3",
      imageAsset: "assets/images/album.jpg",
    ),
    Song(
      title: "Beach nex",
      artist: "Artist 2",
      asset: "audio/song2.mp3",
      imageAsset: "assets/images/mix2.png",
    ),
    Song(
      title: "WErx Dx",
      artist: "Artist 3",
      asset: "audio/song3.mp3",
      imageAsset: "assets/images/peace.png",
    ),
    Song(
      title: "UI max",
      artist: "Artist 4",
      asset: "audio/song4.mp3",
      imageAsset: "assets/images/young.png",
    ),
    Song(
      title: "NI ubun",
      artist: "Artist 5",
      asset: "audio/song5.mp3",
      imageAsset: "assets/images/album3.png",
    ),
    Song(
      title: "LO bxxg",
      artist: "Artist 6",
      asset: "audio/song6.mp3",
      imageAsset: "assets/images/album2.png",
    ),
  ];

  
  void navigateToSongDetail(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlayPage(
          songs: songs,
          initialIndex: index,
          audioPlayer: audioPlayer,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Playlist Header
        Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 14, right: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Album Cover
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/mix1.png'),
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
                      'Wanderlust Vibes 🎶',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '28 songs',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 16),  Row(
                        children: [
                          // Play Button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(16),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder:(context)=>PlayPage(songs: songs, initialIndex:1, audioPlayer: audioPlayer)));                           },
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
           SafeArea(
            child: Column(
            children: songs.map((song) {
             int index = songs.indexOf(song);
             return Padding(
               padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   ClipRRect(
                     borderRadius: BorderRadius.circular(8),
                     child: Image.asset(
                       song.imageAsset,
                       width: 70,
                       height: 70,
                       fit: BoxFit.cover,
                      ),
                   ),
                   const SizedBox(width: 16),
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           song.title,
                           style:  TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.white,
                             fontSize: 19
                           ),
                         ),
                         Text(
                           song.artist,
                           style: const TextStyle(color: Colors.grey,
                           fontSize: 15),
                         ),
                       ],
                     ),
                   ),
                   ElevatedButton(
                     onPressed: () => navigateToSongDetail(index),
                     child: const Text('Play'),
                   ),
                 ],
               ),
             );
           }).toList(),
         ),
       ),
      ],
    );
  }
}