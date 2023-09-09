import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:stress_management_app/utils/constants.dart';


class PlaySong extends StatefulWidget {

  @override
  State<PlaySong> createState() => _PlaySongState();
}

class _PlaySongState extends State<PlaySong> {
  AudioPlayer audioPlayer = AudioPlayer();

  Duration audioDuration = Duration(seconds: 0);

  void playAudio() async {
  await audioPlayer.play(AssetSource('audio/slowmotion.mp3'));
}

void pauseAudio() {
  audioPlayer.pause();
}

void stopAudio() {
  audioPlayer.stop();
}

double sliderValue = 0.0;

void setAudioPosition(double value) {
  // audioPlayer.seek(Duration(milliseconds: (value * duration.inMilliseconds).round()));
  // audioPlayer.seek(Duration(milliseconds: (value).round()));
  audioPlayer.seek(Duration(milliseconds: value.toInt()));
    setState(() {
      sliderValue = value;
    });
}

  @override
  void initState() {
    super.initState();

    // Fetch the audio duration when the audio is loaded.
    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration;
      });
    });

    // Listen to audio position changes to keep the slider in sync.
    audioPlayer.onPositionChanged.listen((Duration position) {
      setState(() {
        sliderValue = position.inMilliseconds.toDouble();
      });
    });
  }

  String formatDuration(Duration duration) {
  String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
  String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
  return '$minutes:$seconds';
}

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Play Song', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        elevation: 0,
        backgroundColor: kLeadBlack,
      ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Now Playing: Song Name'),

                 // Add a slider for seeking here
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Slider(
                      value: sliderValue,
                      min: 0.0,
                      max: audioDuration.inMilliseconds.toDouble(),
                      onChanged: (double value) {
                        setAudioPosition(value);
                      },
                    ),
                    Text('${formatDuration(audioDuration)}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.play_arrow, color: Colors.white,),
                      onPressed: () {
                        playAudio();
                      },
                    ),
                    IconButton(
                  icon: const Icon(Icons.pause, color: Colors.white,),
                  onPressed: () {
                    pauseAudio();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.stop, color: Colors.white,),
                  onPressed: () {
                    stopAudio();
                  },
                ),
                  ],
                ),
                
              ],
            ),
          ),
        ),
    );
  }
}
