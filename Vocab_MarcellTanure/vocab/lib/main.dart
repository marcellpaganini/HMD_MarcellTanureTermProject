import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './models/fruits.dart';
import './models/albums.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vocab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FirstRoute(),
      debugShowCheckedModeBanner: false,
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
                      context, MaterialPageRoute(builder: (context) =>Menu()),
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



class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lists'),
      ),
      body:  
      ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 150,
                color: Colors.amber[300],
                child: Center(child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 new RaisedButton(
                  child: Text('Colors'),
                  onPressed:(){
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>ListDisplay()),
                    );
                  },
                ),
              ],
            ),
            ),
            );
            }
            ),   
            );
            //child: 
            //new Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //children: <Widget>[
                 //new RaisedButton(
                  //child: Text('${entries[index]}'),
                  //onPressed:(){
                   // Navigator.push(
                      //context, MaterialPageRoute(builder: (context) =>ListDisplay()),
                    //);
                  //},
                //),
              //],
            //),
          //),
          //),
            },
         separatorBuilder: (BuildContext context, int index) => const Divider(),    
      ),
    );  
  }
}


/*
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

List<Albums> _albums = List<Albums>();

  Future <List<Albums>> fetchAlbums() async {
    var url = 'https://jsonplaceholder.typicode.com/albums/1/photos';
    var response = await http.get(url);

    var albums = List<Albums>();

    if(response.statusCode == 200){
      var responseAlbums = json.decode(response.body);

      for (var album in responseAlbums){
        albums.add(Albums.fromJson(album));
      }

    }
    return albums;
  }

@override
  void initState() {
    fetchAlbums().then((value){
         setState(() {
           _albums.addAll(value);
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
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10, left: 10, bottom: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                  child: Image.network(_albums[index].thumbnailUrl,),
                  ),
                  Expanded(
                  child: Text('   The ID is: ' + (_albums[index].id.toString())),
                  ),
                  Expanded(
                  child: Text(_albums[index].title),
                  ),
                ],
              ),
            ),
          );
        },
      )
    );
  }
}
*/

/*
class ListDisplay extends StatefulWidget {
  @override
  _ListDisplayState createState() => _ListDisplayState();
}

class _ListDisplayState extends State<ListDisplay> {
  List<String> listItems = [];
  final TextEditingController tCtrl = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) =>TestDisplay()),
        );
      },
      label: Text('I\'m ready!'),
      icon: Icon(Icons.thumb_up),
      backgroundColor: Colors.green,
    ),
      appBar: AppBar(
        title: Text('Vocab'),
      ),
      
      body:Container(  
        height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
          color: Colors.white,
            child:  GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(10, (index) {
            return Center(
              child: Text(
                'Vocab $index',
                style: Theme.of(context).textTheme.headline5,
              ),
              
            );
            
          }
          ),
          
        ),
        
        
     ),
     
    ); 
  }
}
*/

//----------------------------------------------------------


class ListDisplay extends StatefulWidget {
  ListDisplay({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListDisplayState createState() => _ListDisplayState();
}

class _ListDisplayState extends State<ListDisplay> {

List<Albums> _albums = List<Albums>();

  Future <List<Albums>> fetchAlbums() async {
    var url = 'https://jsonplaceholder.typicode.com/albums/1/photos';
    var response = await http.get(url);

    var albums = List<Albums>();

    if(response.statusCode == 200){
      var responseAlbums = json.decode(response.body);

      for (var album in responseAlbums){
        albums.add(Albums.fromJson(album));
      }

    }
    return albums;
  }

@override
  void initState() {
    fetchAlbums().then((value){
         setState(() {
           _albums.addAll(value);
         });
       });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

      


       return Scaffold(
         floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) =>TestDisplay()),
        );
      },
      label: Text('I\'m ready!'),
      icon: Icon(Icons.thumb_up),
      backgroundColor: Colors.green,
    ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10, left: 10, bottom: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                  child: Image.network(_albums[index].thumbnailUrl,),
                  ),
                  Expanded(
                  child: Text('   The ID is: ' + (_albums[index].id.toString())),
                  ),
                  Expanded(
                  child: Text(_albums[index].title),
                  ),
                ],
              ),
            ),
          );
        },
      )
    );
  }
}


//--------------------------------------------------------


/*new RaisedButton(
                  child: Text('I\'m ready!'),
                  onPressed:(){
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>ListDisplay()),
                    );
                  },
                ),*/

class TestDisplay extends StatefulWidget {
  @override
  _TestDisplayState createState() => _TestDisplayState();
}

class _TestDisplayState extends State<TestDisplay> {
  List<String> listItems = [];
  final TextEditingController tCtrl = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) =>Menu()),
        );
      },
      child: Icon(Icons.menu),
      backgroundColor: Colors.amber,
    ),
      appBar: AppBar(
        title: Text('Vocab'),
      ),
      
      body:Container(  
        height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
          color: Colors.white,
            child:  GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(10, (index) {
            return Center(
              child: Text(
                'Test $index',
                style: Theme.of(context).textTheme.headline5,
              ),
              
            );
            
          }
          ),
          
        ),
        
        
     ),
     
    ); 
  }
}












/*class ListDisplay extends StatefulWidget {
  @override
  _ListDisplayState createState() => _ListDisplayState();
}

class _ListDisplayState extends State<ListDisplay> {
  List<String> listItems = [];
  final TextEditingController tCtrl = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vocab'),
      ),
      
      body: SingleChildScrollView(
        child: Container(  
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              GridView.count(
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(10, (index) {
                  return Center(
                    child: Text(
                      'Vocab $index',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  );
                }
                ),
          
              ),
              new RaisedButton(
                  child: Text('I\'m ready!'),
                  onPressed:(){
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>ListDisplay()),
                    );
                  },
                ),
            ],
              
          ),
              
        ),
        
      ),
      
    ); 
  }
}*/











/*
class FruitPage extends StatefulWidget {
  FruitPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FruitPage> {

List<Fruits> _fruits = List<Fruits>();

  Future <List<Fruits>> fetchFruits() async {
    var url = 'https://raw.githubusercontent.com/marcellpaganini/fruitsJson/master/dbFruitsJson';
    var response = await http.get(url);

    var fruits = List<Fruits>();

    if(response.statusCode == 200){
      var responseFruits = json.decode(response.body);

      for (var fruit in responseFruits){
        fruits.add(Fruits.fromJson(fruit));
      }

    }
    return fruits;
  }

@override
  void initState() {
    fetchFruits().then((value){
         setState(() {
           _fruits.addAll(value);
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
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10, left: 10, bottom: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                  child: Image.network(_fruits[index].image,),
                  ),
                  Expanded(
                  child: Text(_fruits[index].name),
                  ),
                ],
              ),
            ),
          );
        },
      )
    );
  }
}*/