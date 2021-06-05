import 'package:flutter/material.dart';

import 'Pages/base.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Mavel',

      theme: ThemeData(

        primarySwatch: Colors.red,

        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      
      home: Base(),
    );
  }
}
