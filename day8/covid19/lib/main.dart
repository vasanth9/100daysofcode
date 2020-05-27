import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http.get('https://api.covid19api.com/summary');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  //final List<String> Country ;
  final List s;
  final String title;

  Album(this.title, this.s);

  factory Album.fromJson(Map<String, dynamic> json) {
    print(json['Countries'].length);
    var t = json['Countries'].length;
    List lst = [];
    for (int i = 0; i < t; i++) {
      // lst.add(value) = json['Countries'][i]['Country'];
      lst.add(Countries(
          json['Countries'][i]['Country'],
          json['Countries'][i]['CountryCode'],
          json['Countries'][i]['NewConfirmed'],
          json['Countries'][i]['TotalConfirmed'],
          json['Countries'][i]['NewDeaths'],
          json['Countries'][i]['TotalDeaths'],
          json['Countries'][i]['NewRecovered'],
          json['Countries'][i]['TotalRecovered']));
    }
    // print(lst);
    return Album(json['Countries'][0]['Country'].toString(), lst);
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid19',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Covid19')),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var x = snapshot.data.title;
                var y = snapshot.data.s;
                //var i = y[1].toLowerCase();
                var h = y[1].CountryCode.toLowerCase();
                var link = 'https://www.countryflags.io/' + h + '/flat/64.png';
                Image.network(
                  link,
                );
                print(h);
                return ListView.builder(
                    itemCount: y.length,
                    itemBuilder: (BuildContext ctxt, int Index) {
                      h = y[Index].CountryCode.toLowerCase();
                      var link =
                          'https://www.countryflags.io/' + h + '/flat/64.png';
                      return GestureDetector(
                        onTap: () {
                          var g = y[Index];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondRoute(
                                      country: g,
                                    )),
                          );
                        },
                        child: Center(
                          child: Column(
                            children: [
                              Card(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          y[Index].Country,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Image.network(
                                        link,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Cases:${y[Index].TotalConfirmed}",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Deaths:${y[Index].TotalDeaths}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Recovered:${y[Index].TotalRecovered}",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ]),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class Countries {
  String Country;
  String CountryCode;

  int NewConfirmed;

  int TotalConfirmed;
  int NewDeaths;
  int TotalDeaths;
  int NewRecovered;
  int TotalRecovered;
  Countries(
      this.Country,
      this.CountryCode,
      this.NewConfirmed,
      this.TotalConfirmed,
      this.NewDeaths,
      this.TotalDeaths,
      this.NewRecovered,
      this.TotalRecovered);
  @override
  String toString() {
    return '{${this.Country},${this.CountryCode},${this.NewConfirmed},${this.TotalConfirmed},${this.NewDeaths}, ${this.TotalDeaths},${this.NewRecovered},${this.TotalRecovered}}';
  }
}

class SecondRoute extends StatelessWidget {
  final Countries country;
  SecondRoute({this.country});
  @override
  Widget build(BuildContext context) {
    var link = 'https://www.countryflags.io/' +
        country.CountryCode.toLowerCase() +
        '/flat/64.png';
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              '${country.Country}',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Card(
                child:Padding(
                  padding: const EdgeInsets.only(
                      bottom: 6.0, top: 6.0, left: 30.0, right: 30.0),
                  child: Text("Total",style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Expanded(
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 30.0, top: 30.0, left: 16.0, right: 16.0),
                          child: Text(
                            "Confirmed\n\t ${country.TotalConfirmed}",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        )),
                  ),
                  Expanded( 
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 30.0, top: 30.0, left: 16.0, right: 16.0),
                          child: Text(
                            "Deaths\n\t${country.TotalDeaths}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        )),
                  ),
                  Expanded( 
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 30.0, top: 30.0, left: 16.0, right: 16.0),
                          child: Text(
                            "Recovered\n \t${country.TotalRecovered}",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        )),
                  )
                ],
              ),
            ),
            Card(
              child:Padding(
                padding: const EdgeInsets.only(
                    bottom: 6.0, top: 6.0, left: 30.0, right: 30.0),
                child: Text("New",style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),),
              ),
            ),
            Container(

              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 30.0, top: 30.0, left: 16.0, right: 16.0),
                            child: Text(
                              "Confirmed\n\t${country.NewConfirmed}",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          )),
                    ),
                    Expanded(
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 30.0, top: 30.0, left: 16.0, right: 16.0),
                            child: Text(
                              "Deaths\n\t${country.NewDeaths}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          )),
                    ),
                    Expanded( 
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 30.0, top: 30.0, left: 16.0, right: 16.0),
                            child: Text(
                              "Recovered\n\t${country.NewRecovered}",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
