import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWithStroke extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundColor;
  TitleWithStroke(this.text, this.color, this.backgroundColor);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 32.0),
      child: Stack(
        children: <Widget>[
          Container(
              height: 100,
              width: 400,
              padding: EdgeInsets.all(16.0),
              child: CustomPaint(
                painter: CurvePainter(),
              )),
          Positioned(
            top: 24.0,
            left: 8.0,
            right: 8.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: Text(text,
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w800,
                      letterSpacing: .5,
                      color: color,
                      backgroundColor: backgroundColor)),
            ),
          )
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.lime[800];
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 4.0;
    double width = 80.0;
    double height = 80.0;

    var path = Path()
      ..moveTo(width, 0)
      ..lineTo(width / 2, height / 2)
      ..lineTo(0, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
