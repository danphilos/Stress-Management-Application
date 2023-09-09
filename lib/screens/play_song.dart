import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stress_management_app/utils/constants.dart';


class PlaySong extends StatefulWidget {
  final String source;
  final String name;

  PlaySong({required this.source, required this.name});

  @override
  State<PlaySong> createState() => _PlaySongState();
}

class _PlaySongState extends State<PlaySong> {
  AudioPlayer audioPlayer = AudioPlayer();

  Duration audioDuration = Duration(seconds: 0);
  bool isPlaying = false;

  void playAudio() async {
  await audioPlayer.play(AssetSource(widget.source));
}

void pauseAudio() {
  audioPlayer.pause();
}

void stopAudio() {
  audioPlayer.stop();
}

double sliderValue = 0.0;

void setAudioPosition(double value) {
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

    audioPlayer.onPlayerStateChanged.listen((PlayerState s) => {
      if (s == PlayerState.playing) {
      setState(() => isPlaying = true)
    } else if (s == PlayerState.paused) {
      setState(() => isPlaying = false)
    }
    });

  }

  String formatDuration(Duration duration) {
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  String formatSliderValue(double sliderValue) {
  // Convert the slider value (in milliseconds) to a Duration.
  Duration duration = Duration(milliseconds: sliderValue.toInt());

  // Extract minutes and seconds from the duration.
  int minutes = duration.inMinutes;
  int seconds = (duration.inSeconds % 60);

  // Format the minutes and seconds as a string in "mm:ss" format.
  String formattedDuration =
      '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

  return formattedDuration;
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
        title: const Text('Now Playing', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        elevation: 0,
        backgroundColor: kLeadBlack,
      ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: SvgPicture.asset("assets/images/playlist.svg", width: MediaQuery.of(context).size.width,)),
                const SizedBox(height: 12,),
                Text(widget.name),

                 // Add a slider for seeking here
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatSliderValue(sliderValue)),
                    Expanded(
                      flex: 3,
                      child: Slider(
                        activeColor: kYellow,
                        inactiveColor: Colors.white38,
                        value: sliderValue,
                        min: 0.0,
                        max: audioDuration.inMilliseconds.toDouble(),
                        onChanged: (double value) {
                          setAudioPosition(value);
                        },
                      ),
                    ),
                    Text(formatDuration(audioDuration)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.fast_rewind, color: Colors.white,),
                      onPressed: () {
                        pauseAudio();
                      },
                ),
                ClipOval(
                  child: Material(
                    color: kYellowHighlight,
                    child: IconButton(
                          icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white,),
                          onPressed: () {
                            isPlaying ? pauseAudio() : playAudio();
                          },
                        ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.fast_forward, color: Colors.white,),
                  onPressed: () {
                    stopAudio();
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

                const SizedBox(height: 48,)
                
              ],
            ),
          ),
        ),
    );
  }
}
