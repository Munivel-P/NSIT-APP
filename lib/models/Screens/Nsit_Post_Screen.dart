import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nsitapp/Widget/post_item.dart';

class NsitPost {
  String postImg, profileImg, name, caption, viewCount, dayAgo;

  NsitPost.fromMap(Map posts)
      : postImg = posts['postImg'].toString(),
        profileImg = posts['profileImg'].toString(),
        name = posts['name'].toString(),
        caption = posts['desc'].toString(),
        dayAgo = posts['timeAgo'].toString();
}

class NsitPostPage extends StatefulWidget {
  const NsitPostPage({Key key}) : super(key: key);

  @override
  _NsitPostPageState createState() => _NsitPostPageState();
}

class _NsitPostPageState extends State<NsitPostPage> {
  Future<List<NsitPost>> _post;
  FirebaseFirestore _firestore;

  Future<List<NsitPost>> fetchNotes() async {
    var result = await _firestore.collection('NSITPOST').get();
    if (result.docs.isEmpty) {
      return [];
    }
    var nsitPost = <NsitPost>[];
    for (var doc in result.docs) {
      nsitPost.add(NsitPost.fromMap(doc.data()));
    }
    return nsitPost;
  }

  @override
  void initState() {
    super.initState();
    _firestore = FirebaseFirestore.instance;
    _post = fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: _post,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if ((snapshot.data as List).isEmpty) {
                    return Center(
                      child: Text('No Post Added...'),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: () async {
                      setState(() {
                        _post = fetchNotes();
                      });
                    },
                    child: ListView.builder(
                      itemCount: (snapshot.data as List).length,
                      itemBuilder: (context, index) {
                        return NoteTitle1(
                          postnsit: snapshot.data[index],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NoteTitle1 extends StatefulWidget {
  final NsitPost postnsit;
  const NoteTitle1({Key key, this.postnsit}) : super(key: key);

  @override
  _NoteTitle1State createState() => _NoteTitle1State();
}

class _NoteTitle1State extends State<NoteTitle1> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      PostItem(
        postImg: widget.postnsit.postImg,
        profileImg: widget.postnsit.profileImg,
        name: widget.postnsit.name,
        caption: widget.postnsit.caption,
        dayAgo: widget.postnsit.dayAgo,
      )
    ]);
  }
}
