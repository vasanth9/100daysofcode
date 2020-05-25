import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Page1(),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RaisedButton(
          child: Text("GO!"),
          onPressed: (){
            Navigator.of(context).push(_createRoute());
          },
        ),
      ),
    );
  }
}
Route _createRoute(){
  return PageRouteBuilder(
    pageBuilder: (context,animation,secondaryAnimation)=>Page2(),
    transitionsBuilder: (context,animation,secondaryAnimation,child){
      var begin= Offset(0.0,1.0);
      var end=Offset.zero;
      var curve=Curves.ease;
      var tween =Tween(begin:begin,end:end).chain(CurveTween(curve:curve));
      var offsetAnimation =animation.drive(tween);

      return SlideTransition(
          position: offsetAnimation,
          child: child);
    }
  );
}
class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("page2!!!")),
    );
  }
}
