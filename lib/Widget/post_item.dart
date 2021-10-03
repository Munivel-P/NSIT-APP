import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:nsitapp/models/Constant/Constant.dart';

class PostItem extends StatelessWidget {
  final String profileImg;
  final String name;
  final String postImg;
  final String caption;

  // final String viewCount;
  final String dayAgo;
  const PostItem({
    Key key,
    this.profileImg,
    this.name,
    this.postImg,
    // this.viewCount,
    this.dayAgo,
    this.caption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Container(
        color: Color.fromRGBO(234, 234, 234, 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: postColor),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(profileImg),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.adamina(
                              color: black,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ), //ellipsis_h
                  Icon(
                    LineIcons.horizontalEllipsis,
                    color: black,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(postImg), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 11,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "$caption",
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                style: GoogleFonts.adamina(
                    color: black, fontSize: 15, fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            SizedBox(
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                "$dayAgo",
                style: TextStyle(
                    color: black.withOpacity(0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
