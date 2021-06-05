import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
        height: 52.0,
        color: Colors.red,
        onPressed: (){},
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), bottomRight: Radius.circular(16.0))),
        child: Text('WATCH NOW', style: GoogleFonts.robotoCondensed(
                    fontSize: 16.0,color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),)
      
    );
  }
}