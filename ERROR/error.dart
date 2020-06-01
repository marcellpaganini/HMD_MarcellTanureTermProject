import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import './models/countries.dart';

void main() { 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //this widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rest API Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FirstRoute(),
    );
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Vocab * Marcell Tanure'),
      ),
      body: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 new RaisedButton(
                  child: Text('START'),
                  onPressed:(){
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>MyHomePage()),
                    );
                  },
                ),
              ],
            ),
          ),
          //Center(
            //child: Text(
              //'This is demo text',
              //style: TextStyle(
                //fontSize: 30.0,
                //fontFamily: 'Oxygen',
                //fontWeight: FontWeight.bold,
              //)
              //style: GoogleFonts.lato(
                //fontStyle: FontStyle.italic,
                //color: Colors.red,
                //fontSize: 30.0
              //)
            //),
          //),
          
        
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

List<Countries> _countries = List<Countries>();

  Future <List<Countries>> fetchCountries() async {
    var url = 'https://restcountries.eu/rest/v2/regionalbloc/nafta';
    var response = await http.get(url);

    var countries = List<Countries>();

    if(response.statusCode == 200){
      var responseCountries = json.decode(response.body);

      for (var country in responseCountries){
        countries.add(Countries.fromJson(country));
      }

    }
    return countries;
  }

@override
  void initState() {
    fetchCountries().then((value){
         setState(() {
           _countries.addAll(value);
         });
       });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

      


       return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _countries.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 32, left: 16, bottom: 32, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_countries[index].name),
                  Text(_countries[index].capital),
                ],
              ),
            ),
          );
        },
      )
    );
  }
}

