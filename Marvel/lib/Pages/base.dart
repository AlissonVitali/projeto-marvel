import 'package:flutter/material.dart';
import 'package:mavel/Pages/ComicsIssueScreen.dart';
import 'ComicScreen.dart';

import 'Home.dart';


class Base extends StatefulWidget{
  final int currentIndex;
  Base({Key key, this.currentIndex}) : super(key: key);
  @override
  State<StatefulWidget> createState(){
    return _BaseState();
  }
}


class _BaseState extends State<Base>{
  int _currentIndex = 0;
  

  final scaffoldKeyBase = new GlobalKey<ScaffoldState>();
  ifNotNull(){
    if(widget.currentIndex != null){
      setState(() {
        _currentIndex = widget.currentIndex;
      });
    }
  }

  @override
  void initState() {
    ifNotNull();
  
    super.initState();
  }



  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext ctx) {
    debugPrint("CurrentIndex: $_currentIndex");

    List<Widget> _children = [
      new Home(),
      new Comics(),
      new ComicIssues(),
      
    ];
    var bottomNavigationBarItem = new BottomNavigationBarItem(
               
                icon: Icon(Icons.home), title: Text("Home"), );
        return new Scaffold(
          key: scaffoldKeyBase,
          bottomNavigationBar: new BottomNavigationBar(
            currentIndex: _currentIndex,
            selectedFontSize: 16.0,
            fixedColor: Theme
                .of(context)
                .primaryColor,
            type:  BottomNavigationBarType.fixed,
            onTap: onTabTapped,
            items:<BottomNavigationBarItem> [
              bottomNavigationBarItem,
          new BottomNavigationBarItem(
            icon: Icon(Icons.view_compact), 
           
            title: Text("Comics"),),
          new BottomNavigationBarItem(
           
            icon: Icon(Icons.view_comfy), title: Text("Comic Issues"),),
          
        ],
      ),
      body: _children[_currentIndex], 
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  
  
}