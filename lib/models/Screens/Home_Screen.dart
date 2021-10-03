import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'Nsit_Home_Page_Screen.dart';
import 'Nsit_Post_Screen.dart';
import 'Nsit_Short_Screen.dart';
import 'Nsit_Videos_Screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> viewContainer = [
    NsitHomePage(),
    NsitPostPage(),
    NsitVideosC(),
    ShortsNsit()
  ];

  @override
  Widget build(BuildContext context) {
    void onTabTapped(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    return new Scaffold(
      body: viewContainer[currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: currentIndex,
          fixedColor: Colors.red,
          backgroundColor: Colors.amber,
          unselectedItemColor: Colors.black12,
          items: [
            BottomNavigationBarItem(icon: new Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: new LineIcon(Icons.photo_outlined),
              label: "Photo",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.video_library),
              label: "Video",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.photo_library),
              label: "Shorts",
            )
          ]),
    );
  }
}
