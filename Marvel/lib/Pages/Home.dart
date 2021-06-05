import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavel/CustomDesign/arcBanner.dart';
import 'package:mavel/CustomDesign/customButton.dart';
import 'package:mavel/CustomDesign/titleWithStroke.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final heroImage = CachedNetworkImage(
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ9HF1IuElC4crtO9B634WjKXVdvQfaKqEH8A&usqp=CAU",
    fit: BoxFit.fill,
    height: 300.0,
  );
  final secondImage = CachedNetworkImage(
      imageUrl:
          "https://terrigen-cdn-dev.marvel.com/content/prod/1x/008cmv_ons_cut_dsk_03.jpg",
      fit: BoxFit.fill);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          heroImage,
          firstSpace(),
          Container(child: secondSpace(), color: Colors.white),
          Container(child: thirdSpace(), color: Colors.black),
        ],
      )),
    );
  }

  Widget firstSpace() {
    return Stack(
      children: <Widget>[
        ArcBannerImage(70.0, preFirstSpace()),
        Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('SEGUE',
                      style: GoogleFonts.robotoCondensed(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          color: Colors.grey)),
                ),
                Icon(FlutterIcons.facebook_ent, color: Colors.grey),
                SizedBox(width: 16,),
                Icon(FlutterIcons.twitter_ent, color: Colors.grey)
              ],
            ))
      ],
    );
  }

  Widget preFirstSpace() {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(24.0),
        color: Colors.black,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 12.0),
            Text(
              'CAROL DANVERS',
              textAlign: TextAlign.left,
              style: GoogleFonts.robotoCondensed(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              'CAPTAIN MARVEL',
              textAlign: TextAlign.left,
              style: GoogleFonts.robotoCondensed(
                fontSize: 32.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              'Carol Danvers becomes one of the universe\'s most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.',
              textAlign: TextAlign.left,
              style: GoogleFonts.roboto(
                fontSize: 14.0,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 62.0),
          ],
        ));
  }

  Widget secondSpace() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          secondImage,
          SizedBox(height: 4.0),
          Text(
            'CAPTAIN MARVEL',
            textAlign: TextAlign.left,
            style: GoogleFonts.robotoCondensed(
                fontSize: 28.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: .5),
          ),
          SizedBox(height: 12.0),
          Text(
            'Near death, Carol Danvers was transformed into a powerful warrior for the Kree. Now, returning to Earth years later, she must remember her past in order to to prevent a full invasion by shapeshifting aliens, the Skrulls.',
            textAlign: TextAlign.left,
            style: GoogleFonts.roboto(
              fontSize: 14.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20.0),
          CustomButton(),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }
}

Widget thirdSpace() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      TitleWithStroke('LATEST NEWS', Colors.white, Colors.black),
      SizedBox(height: 4.0),
      Text(
        'CAPTAIN MARVEL',
        textAlign: TextAlign.left,
        style: GoogleFonts.robotoCondensed(
            fontSize: 32.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: .5),
      ),
      SizedBox(height: 12.0),
      Text(
        'Near death, Carol Danvers was transformed into a powerful warrior for the Kree. Now, returning to Earth years later, she must remember her past in order to to prevent a full invasion by shapeshifting aliens, the Skrulls.',
        textAlign: TextAlign.left,
        style: GoogleFonts.roboto(
          fontSize: 14.0,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(height: 16.0),
      CustomButton(),
    ],
  );
}
