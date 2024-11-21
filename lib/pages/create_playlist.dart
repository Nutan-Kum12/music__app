import 'package:flutter/material.dart';
import '../audio/filepicker.dart';
class CreatePlaylist extends StatefulWidget {
  final Song song;

  CreatePlaylist({required this.song});

  @override
  _CreatePlaylistState createState() => _CreatePlaylistState();
}

class _CreatePlaylistState extends State<CreatePlaylist> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Playlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Playlist Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String playlistName = _controller.text.trim();

                if (playlistName.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a playlist name')),
                  );
                  return;
                }

                PlaylistManager manager = PlaylistManager();

                // Check if the playlist already exists
                Playlist? existingPlaylist = manager.getPlaylistByName(playlistName);
                if (existingPlaylist != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Playlist "$playlistName" already exists')),
                  );
                  return;
                }

                // Create and add the new playlist
                Playlist newPlaylist = Playlist(name: playlistName);
                newPlaylist.addSong(widget.song);

                manager.addPlaylist(newPlaylist);

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Created and added to "$playlistName"')),
                );
              },
              child: Text('Create Playlist'),
            ),
          ],
        ),
      ),
    );
  }
}

class Song {
  String title;
  String asset;
  String imageAsset;
  bool isFavorite;

  Song({
    required this.title,
    required this.asset,
    required this.imageAsset,
    this.isFavorite = false,
  });
}

class Playlist {
  String name;
  List<Song> songs;

  Playlist({required this.name}) : songs = [];

  void addSong(Song song) {
    songs.add(song);
  }
}

class PlaylistManager {
  static final PlaylistManager _instance = PlaylistManager._internal();

  factory PlaylistManager() {
    return _instance;
  }

  PlaylistManager._internal();

  final List<Playlist> _playlists = [];

  List<Playlist> get playlists => _playlists;

  void addPlaylist(Playlist playlist) {
    _playlists.add(playlist);
  }

  void removePlaylist(String playlistName) {
    _playlists.removeWhere((playlist) => playlist.name == playlistName);
  }

  Playlist? getPlaylistByName(String name) {
    try {
      return _playlists.firstWhere((playlist) => playlist.name == name);
    } catch (e) {
      return null;
    }
  }
}