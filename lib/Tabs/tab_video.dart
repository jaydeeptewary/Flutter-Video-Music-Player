import 'package:Video_Player/chewie_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:video_player/video_player.dart';

class tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      color: Colors.blue,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            elevation: 10,
            child: Column(
              children: <Widget>[
                Text(
                  "Flutter Introduction",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Using Local Asset",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 2,
                ),
              ],
            ),
          ),
          ChewieListItem(
            videoPlayerController:
                VideoPlayerController.asset("Video/Introducing_Flutter.mp4"),
            looping: true,
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            color: Color(0xff0039cb),
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            elevation: 10,
            child: Column(
              children: <Widget>[
                Text(
                  "TedTalk by Vimal Daga Sir",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Using AWS S3 Storage",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
              ],
            ),
          ),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
                "https://flutterlighting.s3.ap-south-1.amazonaws.com/The+plight+of+ignorant+-+Vimal+Daga+-+TEDxUPES.mp4"),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            elevation: 10,
            child: Column(
              children: <Widget>[
                Text(
                  "Making India Future Ready!!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Using AWS S3 Storage",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 2,
                ),
              ],
            ),
          ),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
                "https://flutterlighting.s3.ap-south-1.amazonaws.com/Biggest+Ever+Technical+Internship+in+Entire+India+-+Mentored+by+Mr.+Vimal+Daga.mp4"),
          ),
        ],
      ),
    )));
  }
}
