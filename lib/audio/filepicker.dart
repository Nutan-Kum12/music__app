import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'favourite.dart';
import 'songdetail.dart';

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

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();
  List<Song> songs = [
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
      imageAsset: "assets/images/album1.png",
    ),
    Song(
      title: "WErx Dx",
      artist: "Artist 3",
      asset: "audio/song3.mp3",
      imageAsset: "assets/images/search4.png",
    ),
    Song(
      title: "UI max",
      artist: "Artist 4",
      asset: "audio/song4.mp3",
      imageAsset: "assets/images/album2.png",
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

  int? currentlyPlayingIndex;

  void navigateToSongDetail(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SongDetailScreen(
          songs: songs,
          initialIndex: index,
          audioPlayer: audioPlayer,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteScreen(
                    favoriteSongs: songs.where((song) => song.isFavorite).toList(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              child: Card(
                color: const Color.fromARGB(255, 0, 0, 0),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: Padding(
                    padding:  EdgeInsets.only(left: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        songs[index].imageAsset,
                        width: 60, // Updated width
                        height: 80, // Updated height
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    songs[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold,
                    color:Colors.white ),
                  ),
                  subtitle: Text(songs[index].artist,
                  style: TextStyle(color: Colors.white),), // Display artist name
                  onTap: () => navigateToSongDetail(index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
