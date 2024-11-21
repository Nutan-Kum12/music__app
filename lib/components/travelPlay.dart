import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'filepicker.dart';
import 'travelPlaylist.dart';

class PlayPage extends StatefulWidget {
  final List<Song> songs;
  final int initialIndex;
  final AudioPlayer audioPlayer;

   PlayPage({
    Key? key,
    required this.songs,
    required this.initialIndex,
    required this.audioPlayer,
  }) : super(key: key);

  @override
  _SongDetailScreenState createState() => _SongDetailScreenState();
}

class _SongDetailScreenState extends State<PlayPage> {
  late int currentIndex;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    setupAudioPlayer();
    Future.delayed(Duration.zero, playCurrentSong);
  }
  @override
void dispose() {
  // Stop the audio player when leaving the screen
  widget.audioPlayer.stop();
  super.dispose();
}


  void setupAudioPlayer() {
    widget.audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    widget.audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    widget.audioPlayer.onPlayerComplete.listen((_) {
      playNext();
    });

    widget.audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
  }

  Future<void> playCurrentSong() async { 
    try{
      String assetPath = widget.songs[currentIndex].asset;
        print("Asset Path: $assetPath");
      await widget.audioPlayer.stop();
      print("Before playing: $assetPath");
    // await widget.audioPlayer.play(AssetSource(widget.songs[currentIndex].asset));
    // await widget.audioPlayer.play(AssetSource('audio/song2.mp3'));

    await widget.audioPlayer.play(AssetSource(assetPath));
    print("After playing: $assetPath");
    setState(() {
      isPlaying = true;
    });
    }
    catch(e)
    {
      print("error playing music:$e");
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Unable to play song: ${widget.songs[currentIndex].title}")),
      );
    }
  }

  Future<void> playPause() async {
    if (isPlaying) {
      await widget.audioPlayer.pause();
    } else {
      await playCurrentSong();
    }
  }

  Future<void> playNext() async {
    if (currentIndex < widget.songs.length - 1) {
      currentIndex++;
    } else {
      currentIndex = 0;
    }
    await widget.audioPlayer.stop();
    await playCurrentSong();
  }

  Future<void> playPrevious() async {
    if (currentIndex > 0) {
      currentIndex--;
    } else {
      currentIndex = widget.songs.length - 1;
    }
    await widget.audioPlayer.stop();
    await playCurrentSong();
  }

  Future<void> seekTo(Duration newPosition) async {
    await widget.audioPlayer.seek(newPosition);
  }

  void toggleFavorite() {
    setState(() {
      widget.songs[currentIndex].isFavorite = !widget.songs[currentIndex].isFavorite;
    });
  }
  

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }


  @override
Widget build(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight= MediaQuery.of(context).size.height;

  return  
     Scaffold(
       body: SingleChildScrollView(
         child: SafeArea(
          child: Column(
            children: [
              // Top navigation bar with back button and song title
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_down, size: 36, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      widget.songs[currentIndex].title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Icon(Icons.more_vert, size: 28, color: Colors.white),
                  ],
                ),
              ),
             
              // Album art
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                  width: screenWidth * 0.63,
                  height: screenHeight * 0.32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage(widget.songs[currentIndex].imageAsset),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
             
              // Song title and artist name
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  children: [
                    Text(
                      widget.songs[currentIndex].title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "Artist Name",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
             
              // Playback slider
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.white24,
                        thumbColor: Colors.white,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
                      ),
                      child: Slider(
                        value: position.inSeconds.toDouble(),
                        min: 0,
                        max: duration.inSeconds.toDouble(),
                        onChanged: (value) {
                          seekTo(Duration(seconds: value.toInt()));
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatDuration(position),
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        Text(
                          formatDuration(duration),
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
             
              // Playback controls
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.skip_previous),
                      iconSize: 48,
                      color: Colors.white,
                      onPressed: playPrevious,
                    ),
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 40,
                          color: Colors.black,
                        ),
                        onPressed: playPause,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.skip_next),
                      iconSize: 48,
                      color: Colors.white,
                      onPressed: playNext,
                    ),
                  ],
                ),
              ),
             
              // Favorite button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: IconButton(
                  icon: Icon(
                    widget.songs[currentIndex].isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: widget.songs[currentIndex].isFavorite ? Colors.red : Colors.white,
                  ),
                  iconSize: 36,
                  onPressed: toggleFavorite,
                ),
              ),
             
              // Up next section (queue placeholder)
              Divider(color: Colors.white24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Up Next",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      "Queue",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
             
              // Queue list
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.songs.length,
                itemBuilder: (context, index) {
                  // Skip the currently playing song
                  if (index == currentIndex) return SizedBox.shrink();
                         
                  final song = widget.songs[index];
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        song.imageAsset,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      song.title,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Artist Name",
                      style: TextStyle(color: Colors.white70),
                    ),
                    trailing: Icon(Icons.more_vert, color: Colors.white),
                    onTap: () async {
                      // Play the selected song when tapped
                      setState(() {
                        currentIndex = index;
                      });
                      await playCurrentSong();
                    },
                  );
                },
              ),
            ],
          ),
             ),
       ),
     ); 
}
}
