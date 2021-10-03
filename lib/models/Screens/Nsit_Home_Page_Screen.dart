import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsitapp/Widget/Academic_Details.dart';
import 'package:nsitapp/Widget/Academic_Screen.dart';
import 'package:url_launcher/url_launcher.dart';

class NsitHomePage extends StatelessWidget {
  const NsitHomePage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Carousel(
                          boxFit: BoxFit.cover,
                          autoplay: true,
                          animationCurve: Curves.fastOutSlowIn,
                          animationDuration: Duration(seconds: 1),
                          dotSize: 6.0,
                          dotIncreasedColor: Color(0xFFFF335C),
                          dotBgColor: Colors.transparent,
                          dotPosition: DotPosition.bottomCenter,
                          dotVerticalPadding: 10.0,
                          showIndicator: true,
                          indicatorBgPadding: 7.0,
                          images: [
                            Container(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                                text: 'Welcome to ',
                                                style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    fontStyle:
                                                        FontStyle.italic)),
                                            TextSpan(
                                              text: "Narasu's Sarathy",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 21.0,
                                                  color: Colors.red),
                                            ),
                                            TextSpan(
                                                text:
                                                    ' Institute of Technology',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17.0)),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/carousel/1.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            AssetImage("assets/carousel/2.jpg"),
                            AssetImage("assets/carousel/3.jpg"),
                            AssetImage("assets/carousel/5.jpg"),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Welcome To ',
                              style: GoogleFonts.adamina(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                                  "\nNarasu's Sarathy Institute Of Technology",
                              style: GoogleFonts.adamina(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Founded in 2008, Sri. Narasu’s R. P. Sarathy",
                        style: GoogleFonts.adamina(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "by Smt. Mahalakshmi Educational Trust, Narasu's Sarathy Institute of Technology represents a rich tradition of excellence in technology-based education. A premier-league institution among the affiliates of Anna university, owes its vision to late Sri. Narasu’s R.P.Sarathy an Entrepreneur, Educationalist and Philanthropist.Narasu’s Sarathy Institute of Technology in its 12 years of existence, is a reputed Institution in the State of Tamilnadu...",
                        style: GoogleFonts.adamina(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        "COURSE OFFERED",
                        style: GoogleFonts.adamina(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        color: Colors.red,
                        indent: 0.6,
                        thickness: 2.2,
                        endIndent: MediaQuery.of(context).size.width * 0.8,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          for (var item in academicDetails)
                            DetailsAcademic(
                              item: item,
                            )
                        ]),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Why Choose Us?",
                        style: GoogleFonts.adamina(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        color: Colors.red,
                        indent: 0.6,
                        thickness: 2.2,
                        endIndent: MediaQuery.of(context).size.width * 0.8,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/carousel/4.jpg"))),
                      ),
                      Text(
                        "NSIT is an institution that has scaled unimaginable heights for an entity so young. The main factor for this is the strong and dedicated management whose only aim is to create engineers of world -class ability.Institutions that are on par with NSIT in terms of infrastructure, teachers and technology are very few and far apart. The industry exposure it offers is extremely valuable .",
                        style: GoogleFonts.adamina(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Divider(
                        color: Colors.red,
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Center(
                        child: TextButton(
                          child: Text("Visit our Website"),
                          onPressed: () async =>
                              await canLaunch("https://www.nsit.edu.in/")
                                  ? await launch("https://www.nsit.edu.in/")
                                  : throw "Cannot launched",
                        ),
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsAcademic extends StatelessWidget {
  const DetailsAcademic({
    Key key,
    @required this.item,
  }) : super(key: key);

  final AcademicDetails item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AcademicScreen(
                  rk: item,
                )),
      ),
      child: Card(
        elevation: 0,
        //color: Colors.red.withOpacity(1),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            height: 180,
            width: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                            item.cardimg,
                          ),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 2),
                  child: Text(
                    item.cardtitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.adamina(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
