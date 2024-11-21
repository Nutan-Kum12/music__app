import 'package:flutter/material.dart';
import '../audio/filepicker.dart';
class PlaylistScreen extends StatelessWidget {
  final Song song;

  PlaylistScreen({required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Playlist'),
      ),
      body: Column(
        children: [
          Text('Add "${song.title}" to a Playlist', style: TextStyle(fontSize: 18)),

          ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: Text('Playlist 1', style: TextStyle(color: Colors.white)),
                onTap: () {

                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to Playlist 1',style: TextStyle(color: Colors.white))));
                },
              ),
              ListTile(
                title: Text('Playlist 2', style: TextStyle(color: Colors.white)),
                onTap: () {

                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to Playlist 2', style: TextStyle(color: Colors.white))));
                },
              ),

              ListTile(
                title: Text('Create New Playlist', style: TextStyle(color: Colors.white)),
                onTap: () {
                    Navigator.pushNamed(context, "/create_playlist") ;

                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
