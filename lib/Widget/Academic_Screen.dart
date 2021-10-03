import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsitapp/models/Constant/Constant.dart';

import 'Academic_Details.dart';

class AcademicScreen extends StatefulWidget {
  final AcademicDetails rk;

  const AcademicScreen({Key key, this.rk}) : super(key: key);

  @override
  _AcademicScreenState createState() => _AcademicScreenState();
}

class _AcademicScreenState extends State<AcademicScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 145,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.rk.img), fit: BoxFit.cover)),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          widget.rk.imgdetails,
                          style: GoogleFonts.spectral(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.rk.title,
                  style: GoogleFonts.adamina(
                      color: black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.rk.desc,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.adamina(
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Divider(
                indent: 4,
                color: Colors.grey,
                thickness: 3,
              ),
              SizedBox(
                height: 12,
              ),
              Center(
                child: Text(
                  "LAB FACILITIES",
                  style: GoogleFonts.spectral(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.rk.labfacility.labtitle,
                        style: GoogleFonts.spectral(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        widget.rk.labfacility.labdesc,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.spectral(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                indent: 4,
                color: Colors.grey,
                thickness: 3,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.rk.library.title,
                  style: GoogleFonts.spectral(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.rk.library.desc,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.spectral(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
