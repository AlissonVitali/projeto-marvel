import 'package:flutter/material.dart';
//import 'package:cached_network_image/cached_network_image.dart';

class ArcBannerImage extends StatelessWidget {
  ArcBannerImage(this.padding, this.view);

  //final Image image;
  final double padding;
  final Widget view;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

     return  Padding(
        padding: EdgeInsets.only(bottom: padding),
        child: ClipPath(
          clipper: ArcClipper(),
          child: 
              Container(
                child: view,
                  width: screenWidth,
                
                
                )
              
        ));
  }
}

     //ClipPath(
    //     clipper: ArcClipper(),
    //     child: Padding(
    //         padding: EdgeInsets.only(bottom: padding),
    //         child: Container(
    //           width: screenWidth,
    //           color: Colors.black,
    //           height: 300.0,
    //           child: image,
    //         )
            // : CachedNetworkImage(
            //     imageUrl: "https://eventpalz.com.ng/$imageUrl",
            //     width: screenWidth,
            //     errorWidget: (context, url, error) => new Container(
            //       width: screenWidth,
            //       color: Theme.of(context).primaryColor,
            //       height: 160.0,
            //     ),
            //     height: 160.0,
            //     fit: BoxFit.cover,
            //     color: Theme.of(context).primaryColor.withOpacity(1.0),
            //     colorBlendMode: BlendMode.softLight,
            //   ),
//             ));
//   }
// }

class ArcClipper extends CustomClipper<Path> {
  
  @override
  Path getClip(Size size) {
    // var path = Path();
    // path.lineTo(0.0, size.height - 70);

    Path path = Path()
    ..lineTo(0, 0)
    ..lineTo(size.width, 0) // Add line p1p2
    ..lineTo(size.width, size.height-30)
    ..lineTo(0, size.height) // Add line p2p3
    ..close();

    // var firstControlPoint = Offset(size.width / 70, size.height);
    // var firstPoint = Offset(size.width / 70, size.height);
    // path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
    //     firstPoint.dx, firstPoint.dy);

    // var secondControlPoint =
    //     Offset(size.width - (size.width / 80), size.height);
    // var secondPoint = Offset(size.width, size.height - 80);
    // path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
    //     secondPoint.dx, secondPoint.dy);

    // path.lineTo(size.width, 0.0);
    // path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
