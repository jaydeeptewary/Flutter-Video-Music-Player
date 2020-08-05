import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:video_player/video_player.dart';
//import 'package:Video_Player/chewie_list_item.dart';
//import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class tab2 extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<tab2> {
  AudioPlayer audioPlayer = new AudioPlayer();
  Duration duration = new Duration();
  Duration position = new Duration();
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.blue,
            body: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Color(0x46000000),
                          offset: Offset(0, 20),
                          spreadRadius: 0,
                          blurRadius: 40,
                        ),
                        BoxShadow(
                          color: Color(0x11000000),
                          offset: Offset(0, 10),
                          spreadRadius: 0,
                          blurRadius: 30,
                        )
                      ]),
                      child: ClipRRect(
                        //read about this
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://flutterlighting.s3.ap-south-1.amazonaws.com/Icon.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Flute",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text("Using AWS S3 Storage"),
                    SizedBox(
                      height: 10,
                    ),
                    Slider.adaptive(
                      activeColor: Color(0xff69e2ff),
                      inactiveColor: Color(0xff004ba0),
                      value: position.inSeconds.toDouble(),
                      max: duration.inSeconds.toDouble(),
                      min: 0,
                      onChanged: (double value) {
                        setState(() {
                          audioPlayer
                              .seek(new Duration(seconds: value.toInt()));
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            getaudio();
                          },
                          child: Icon(
                            playing == false ? Icons.play_arrow : Icons.pause,
                            size: 70,
                            color: Color(0xff0039cb),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )));
  }

  void getaudio() async {
    var url =
        "https://flutterlighting.s3.ap-south-1.amazonaws.com/heart+touch+flute+music+(online-audio-converter.com).mp3";
    if (playing) {
      var res = await audioPlayer.pause();
      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      var res = await audioPlayer.play(url, isLocal: true);
      if (res == 1) {
        setState(() {
          playing = true;
        });
      }
    }

    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration d) {
      setState(() {
        position = d;
      });
    });
  }
}
