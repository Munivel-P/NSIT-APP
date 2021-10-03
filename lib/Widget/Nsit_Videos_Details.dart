import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsitapp/models/Constant/Constant.dart';
import 'package:nsitapp/models/Screens/Nsit_Videos_Screen.dart';
import 'package:url_launcher/url_launcher.dart';

class NsitVideosDatails extends StatefulWidget {
  final NsitVideos nsitvideos;

  const NsitVideosDatails({Key key, this.nsitvideos}) : super(key: key);

  @override
  _NsitVideosDatailsState createState() => _NsitVideosDatailsState();
}

class _NsitVideosDatailsState extends State<NsitVideosDatails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        //  splashColor: Colors.red,
        focusColor: Colors.red,
        highlightColor: Colors.black26,
        onTap: () async => await canLaunch(widget.nsitvideos.url)
            ? await launch(widget.nsitvideos.url)
            : throw 'Could not launch $widget.useNsit1.url',
        child: Container(
          color: Color.fromRGBO(234, 234, 234, 0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 1,
              ),
              Container(
                height: 220,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.nsitvideos.image),
                        fit: BoxFit.cover)),
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
                  widget.nsitvideos.title,
                  textAlign: TextAlign.justify,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.adamina(
                      color: black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "${widget.nsitvideos.desc}",
                  textAlign: TextAlign.justify,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.adamina(
                      color: black.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              SizedBox(
                height: 14,
              )
            ],
          ),
        ),
      ),
    );
  }
}
