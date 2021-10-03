import 'package:flutter/material.dart';
import 'package:nsitapp/models/Screens/Nsit_Short_Screen.dart';

class OptionsScreen extends StatelessWidget {
  final Shorts shortsinfo;

  const OptionsScreen({Key key, @required this.shortsinfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 110),
                Row(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person, size: 18),
                      radius: 16,
                    ),
                    SizedBox(width: 6),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        shortsinfo.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.verified,
                      size: 15,
                      color: Colors.white,
                    ),
                    SizedBox(width: 6),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Follow',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 6),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      '  ${shortsinfo.desc}',
                      style: TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.music_note,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        shortsinfo.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.favorite_outline,
                  color: Colors.white,
                ),
                Text(
                  '601k',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 25),
                Icon(
                  Icons.comment_rounded,
                  color: Colors.white,
                ),
                Text(
                  '1123',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 25),
                Transform(
                  transform: Matrix4.rotationZ(5.8),
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50),
                Icon(Icons.more_vert),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
