import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.green,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Opacity Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _visible= true;
 @override
  Widget build(BuildContext context) {

   return Scaffold(
     appBar: AppBar(
       title: Text(widget.title),
     ),
     body: Center(
       child: AnimatedOpacity(
         opacity: _visible?1.0:0.0,
         duration:Duration(milliseconds: 500),
         child: Container(
           width: 200.0,
             height: 200.0,
           color: Colors.blueAccent,
         ),
       ),
     ),
     floatingActionButton: FloatingActionButton(
       onPressed: (){
         setState(() {
           _visible=!_visible;
         });
       },
       tooltip: "Toggle Opacity",
       child: Icon(Icons.flip),
     ),
   );

  }
}















