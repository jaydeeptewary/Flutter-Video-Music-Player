import 'package:Video_Player/Tabs/tab_video.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'Tabs/tab_video.dart';
import 'Tabs/tab_audio.dart';

main() => runApp(App());

int currentIndex = 0;
final tabs = [
  tab1(),
  tab2(),
];

class App extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: tabs[currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blue,
          height: 50,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          animationDuration: Duration(
            milliseconds: 200,
          ),
          animationCurve: Curves.bounceInOut,
          index: currentIndex, //by default will launch from here
          items: <Widget>[
            Icon(
              Icons.videocam,
              size: 20,
              color: Colors.black,
            ),
            Icon(
              Icons.music_note,
              size: 20,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
