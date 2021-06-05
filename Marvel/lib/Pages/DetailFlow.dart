import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavel/Network/ApiLinks.dart';


class DetailFlow extends StatefulWidget {
  final image,
      issueNumber,
      title,
      description,
      ups,
      format,
      series,
      date,
      prices,
      images,
      creators,
      characters,
      stories,
      events;
  DetailFlow(
      {this.image,
      this.issueNumber,
      this.title,
      this.description,
      this.ups,
      this.format,
      this.series,
      this.date,
      this.prices,
      this.images,
      this.creators,
      this.characters,
      this.stories,
      this.events});
  @override
  _DetailFlowState createState() => _DetailFlowState();
}

class _DetailFlowState extends State<DetailFlow> {
  FetchData _fetchData;
  @override
  void initState() {
    _fetchData = FetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Characters:${widget.characters}");
    return Scaffold(
      appBar: AppBar(title: Text("Details")),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget.image == ''
              ? Container()
              : CachedNetworkImage(
                  imageUrl: '${widget.image}',
                  width: double.infinity,
                  height: 300.0,
                  fit: BoxFit.fill,
                ),
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              '${widget.title}',
              style: GoogleFonts.lato(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          widget.description == null
              ? Container()
              : Container(
                  margin: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Text(
                    '${widget.description}',
                    style: GoogleFonts.lato(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
          widget.issueNumber == null
              ? Container()
              : Text(
                  'Issue Number: ${widget.issueNumber}',
                  style: GoogleFonts.lato(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              '${(widget.prices[0]['type']).toUpperCase()} : ${widget.prices[0]['price']}',
              style: GoogleFonts.lato(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          widget.images == '' ? Container() : images(widget.images),
          widget.characters.isEmpty
              ? Container()
              : Container(
                  margin: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Text(
                    'Characters',
                    style: GoogleFonts.lato(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
          widget.characters.isEmpty
              ? Container()
              : charactersList(widget.characters),
              Divider(height: 2.0,color: Colors.white,),
          widget.creators.isEmpty
              ? Container()
              : Container(
                  margin: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Text(
                    'Creators',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.lato(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ),
          widget.creators.isEmpty
              ? Container()
              :creators(widget.creators),
        ],
      )),
    );
  }

  images(final images) {
    return Container(
      margin: EdgeInsets.all(16.0),
      height: 150,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),

        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, int currentIndex) {
          return imagesView(images[currentIndex], context);
        },
        
      ),
    );
  }

  imagesView(final _image, BuildContext context) {
    return CachedNetworkImage(
      imageUrl: '${_image['path']}' + '.' + '${_image['extension']}',
      fit: BoxFit.fill,
    );
  }

  creators(final creators) {
    return Container(
      height: 230.0,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),

        itemCount: creators.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, int currentIndex) {
          return creatorsView(creators[currentIndex], context);
        },
        
      ),
    );
  }

  creatorsView(final creators, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.0)),
        color: Colors.white,
      ),
      margin: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          thumbnailView(creators, context),
          Container(
            margin: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Text(
              '${creators['name']}',
              style: GoogleFonts.lato(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Text(
              '(${creators['role']})',
              style: GoogleFonts.lato(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  thumbnailView(final character, BuildContext context) {
    var link = (character['resourceURI']).replaceRange(0, 25, "");
    print(link);
    return FutureBuilder<dynamic>(
        future: _fetchData.characterOrStories(link),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            var characterData = snapshot.data;

            return CachedNetworkImage(
              imageUrl: '${characterData[0]['thumbnail']['path']}' +
                  '.' +
                  '${characterData[0]['thumbnail']['extension']}',
              width: 120.0,
              height: 150.0,
              fit: BoxFit.cover,
            );
          }

          return new Center(
            
              child: CircularProgressIndicator(
            strokeWidth: 2.0,
          ));
        });
  }

  charactersList(final characters) {
    return Container(
      height: 220.0,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: characters.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, int currentIndex) {
          return charactersView(characters[currentIndex], context);
        },
      ),
    );
  }

  charactersView(final characters, BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.0)),
          color: Colors.white,
        ),
        margin: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            thumbnailView(characters, context),
            Container(
              padding: EdgeInsets.all(4.0),
              width: 140,
              child: Text(
                '${characters['name']}',
                style: GoogleFonts.lato(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            )
          ],
        ));
  }
}
