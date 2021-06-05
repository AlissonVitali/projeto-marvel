import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mavel/Network/ApiLinks.dart';
import 'package:mavel/Models/ApiModel.dart';

import 'DetailFlow.dart';

class Comics extends StatefulWidget {
  @override
  _ComicsState createState() => _ComicsState();
}

class _ComicsState extends State<Comics> {
  FetchData _fetchData;
  @override
  void initState() {
    _fetchData = FetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title:Text('Marvel')),
      body: comicList(),
    );
  }

  comicList() {
    var data = _fetchData.comic('/v1/public/comics');
    print(data);
    return FutureBuilder<List<ComicIssue>>(
        future: _fetchData.comic('/v1/public/comics'),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            List<ComicIssue> comicData = snapshot.data;
            return new CustomComicView(comicData);
          }

          return new Center(
              child: CircularProgressIndicator(
            strokeWidth: 2.0,
          ));
        });
  }
}

class CustomComicView extends StatelessWidget {
  final List<ComicIssue> comicIssueData;

  CustomComicView(this.comicIssueData);

//git push origin master
  Widget build(context) {
    return GridView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: comicIssueData.length,
      padding: EdgeInsets.only(
        top: 8.0,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 2.0, mainAxisSpacing: 2.0),
      itemBuilder: (context, int currentIndex) {
        return createItemView(comicIssueData[currentIndex], context);
      },
    );
  }

  Widget createItemView(
    ComicIssue comicIssueData,
    BuildContext context,
  ) {
    return Stack(children: <Widget>[
      new Positioned.fill(
          child: GridTile(
        child: Card(
          elevation: 2.0,
          color: Colors.white,
          margin: EdgeInsets.all(1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              comicIssueData.images.length == 0
                  ? Expanded(
                      child: new Container(
                        height: 180.0,
                        width: double.infinity,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2.0),
                        ),
                        child: new Icon(
                          Icons.person,
                          size: 60.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    )
                  : new Expanded(
                      child: Container(
                      height: 180.0,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: '${comicIssueData.images[0]['path']}' +
                            '.' +
                            '${comicIssueData.images[0]['extension']}',
                        fit: BoxFit.cover,
                      ),
                    )),
              
              Container(
                padding: EdgeInsets.all(4.0),
                height: 28.0,
                child: Text(
                  '${comicIssueData.title}',
                  maxLines: 2,
                  style: GoogleFonts.robotoCondensed(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0),
                ),
                // ),
              ),
              Container(padding: EdgeInsets.only(left:4.0, right: 4.0, bottom:4.0),
                height: 20.0,
                child: Text(
                  comicIssueData.date[0]['date'].replaceRange(10, 24, ""),
                  style: GoogleFonts.robotoCondensed(
                      color: Colors.black87,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
                // ),
              ),
              SizedBox(height: 4),
            ],
          ),
        ),
      )),
      Positioned(
        child: new Material(
            color: Colors.transparent,
            child: new InkWell(onTap: () {
              var route = new MaterialPageRoute(
                  builder: (BuildContext context) => new DetailFlow(
                      image: comicIssueData.images.length == 0
                          ? ''
                          : '${comicIssueData.images[0]['path']}' +
                              '.' +
                              '${comicIssueData.images[0]['extension']}',
                      issueNumber: comicIssueData.ups,
                      title: comicIssueData.title,
                      description: comicIssueData.description,
                      ups: comicIssueData.ups,
                      format: comicIssueData.format,
                      date: comicIssueData.date,
                      prices: comicIssueData.prices,
                      images: comicIssueData.images.length == 0
                          ? ''
                          :comicIssueData.images,
                      creators: comicIssueData.creators,
                      characters: comicIssueData.characters,
                      stories: comicIssueData.stories,
                      events: comicIssueData.events));
              Navigator.of(context).push(route);
            })),
      ),
    ]);
  }
}
