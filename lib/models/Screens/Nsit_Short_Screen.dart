import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:nsitapp/Widget/NsitShorts/like_icon.dart';
import 'package:nsitapp/Widget/NsitShorts/options_screen.dart';
import 'package:video_player/video_player.dart';

class Shorts {
  String title, desc, videourl;
  Shorts.fromMap(Map m)
      : title = m['title'].toString(),
        videourl = m['videoUrl'].toString(),
        desc = m['desc'].toString();
}

class ShortsNsit extends StatefulWidget {
  const ShortsNsit({Key key}) : super(key: key);

  @override
  _ShortsNsitState createState() => _ShortsNsitState();
}

class _ShortsNsitState extends State<ShortsNsit> {
  Future<List<Shorts>> _notes;
  FirebaseFirestore _firestore;

  Future<List<Shorts>> fetchNotes() async {
    var result = await _firestore.collection('NSITSHORTS').get();
    if (result.docs.isEmpty) {
      return [];
    }
    var notes = <Shorts>[];
    for (var doc in result.docs) {
      notes.add(Shorts.fromMap(doc.data()));
    }
    return notes;
  }

  @override
  void initState() {
    super.initState();
    _firestore = FirebaseFirestore.instance;
    _notes = fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              FutureBuilder(
                future: _notes,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if ((snapshot.data as List).isEmpty) {
                    return Center(
                      child: Text(
                        'No Shorts Added.',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () async {
                      setState(() {
                        _notes = fetchNotes();
                      });
                    },
                    child: Container(
                      child: Stack(
                        children: [
                          //We need swiper for every content
                          Swiper(
                            itemBuilder: (context, index) {
                              return ContentScreen1(
                                src: snapshot.data[index],
                              );
                            },
                            itemCount: (snapshot.data as List).length,
                            scrollDirection: Axis.vertical,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'NSIT Shorts',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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

class ContentScreen1 extends StatefulWidget {
  final Shorts src;

  const ContentScreen1({Key key, @required this.src}) : super(key: key);

  @override
  _ContentScreen1State createState() => _ContentScreen1State();
}

class _ContentScreen1State extends State<ContentScreen1> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  bool _liked = false;
  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget
            .src.videourl ??
        "https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4");
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _chewieController != null &&
                _chewieController.videoPlayerController.value.isInitialized
            ? GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    _liked = !_liked;
                  });
                },
                child: Chewie(
                  controller: _chewieController,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Loading...')
                ],
              ),
        if (_liked)
          Center(
            child: LikeIcon(),
          ),
        OptionsScreen(
          shortsinfo: widget.src,
        )
      ],
    );
  }
}
