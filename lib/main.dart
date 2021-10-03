import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'models/Screens/Nsit_Post_Screen.dart';
import 'models/Screens/Nsit_Short_Screen.dart';
import 'models/Screens/Nsit_Videos_Screen.dart';
import 'models/Constant/Constant.dart';
import 'models/Screens/Home_Screen.dart';
import 'models/Screens/Nsit_Home_Page_Screen.dart';
import 'models/Screens/Splash_Screen.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.red));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nsit App',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          accentColor: Colors.black,
          indicatorColor: Colors.black12,
          highlightColor: Colors.black12,
          bottomAppBarColor: Colors.white,
          primaryColor: Color(0xFFffffff),
          primaryColorDark: Color(0xffffff)),
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        homeScreen2: (BuildContext context) => new HomeScreen(),
        animatedSplash2: (BuildContext context) => new SplashScreen(),
        nsitHomePage2: (BuildContext context) => new NsitHomePage(),
        postContainerScreen2: (BuildContext context) => new NsitPostPage(),
        videoContainerScreen2: (BuildContext context) => NsitVideosC(),
        shortsContainerScreen2: (BuildContext context) => new ShortsNsit()
      },
    );
  }
}
