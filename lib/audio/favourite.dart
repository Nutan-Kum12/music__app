import 'package:flutter/material.dart';
// import 'music_player_screen.dart';
import 'filepicker.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Song> favoriteSongs;

  FavoriteScreen({required this.favoriteSongs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Songs'),
      ),
      body: favoriteSongs.isEmpty
          ? Center(child: Text('No favorite songs yet'))
          : ListView.builder(
              itemCount: favoriteSongs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoriteSongs[index].title,style: TextStyle(color: Colors.white,
                  fontSize: 20),),
                  leading: Icon(Icons.music_note,color: Colors.white,size: 20,),
                );
              },
            ),
    );
  }
}