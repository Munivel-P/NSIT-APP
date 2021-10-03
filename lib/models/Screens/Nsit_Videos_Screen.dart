import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Widget/Nsit_Videos_Details.dart';

class NsitVideos {
  String title, desc, image, url;
  NsitVideos.fromMap(Map m)
      : title = m['title'].toString(),
        image = m['imageUrl'].toString(),
        url = m['videoUrl'].toString(),
        desc = m['desc'].toString();
}

class NsitVideosC extends StatefulWidget {
  const NsitVideosC({Key key}) : super(key: key);

  @override
  _NsitVideosCState createState() => _NsitVideosCState();
}

class _NsitVideosCState extends State<NsitVideosC> {
  Future<List<NsitVideos>> _notes;
  FirebaseFirestore _firestore;

  Future<List<NsitVideos>> fetchNotes() async {
    var result =
        await _firestore.collection('NSITVIDEOS').orderBy("ordered").get();
    if (result.docs.isEmpty) {
      return [];
    }
    var nsitvideo = <NsitVideos>[];
    for (var doc in result.docs) {
      nsitvideo.add(NsitVideos.fromMap(doc.data()));
    }
    return nsitvideo;
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
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: _notes,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if ((snapshot.data as List).isEmpty) {
                  return Center(
                    child: Text('No Videos Added.'),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    setState(() {
                      _notes = fetchNotes();
                    });
                  },
                  child: ListView.builder(
                    itemCount: (snapshot.data as List).length,
                    itemBuilder: (context, index) {
                      return NsitVideosDatails(
                        nsitvideos: snapshot.data[index],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
