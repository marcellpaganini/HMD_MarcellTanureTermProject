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
    );
  }
}

//-------------------------------------------------------

final List<String> entries = <String>['Fruits', 'Colors', 'Animals', 'Professions'];
final List<int> colorCodes = <int>[600, 500, 100, 50];
List<Widget> buttons = <Widget>[FruitListDisplay(), ColorListDisplay(), AnimalListDisplay(), ProfessionListDisplay()];

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
            itemCount: 4,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
                height: 150,
                color: Colors.amber[colorCodes[index]],
            child: 
            new Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                  child: Text('${entries[index]}'),
                  onPressed:(){
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>buttons[index],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },    
      ),
    );  
  }
}




//----------------------------------------------------------


class FruitTestDisplay extends StatefulWidget {
  FruitTestDisplay({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FruitTestDisplayState createState() => _FruitTestDisplayState();
}

class _FruitTestDisplayState extends State<FruitTestDisplay> {

final appleController = TextEditingController();
final bananaController = TextEditingController();
final grapeController = TextEditingController();
final pineappleController = TextEditingController();
final watermelonController = TextEditingController();
final lemmonController = TextEditingController();
final orangeController = TextEditingController();
final nectarineController = TextEditingController();
final strawberryController = TextEditingController();
final pearController = TextEditingController();

@override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    appleController.dispose();
    bananaController.dispose();
    grapeController.dispose();
    pineappleController.dispose();
    watermelonController.dispose();
    lemmonController.dispose();
    orangeController.dispose();
    nectarineController.dispose();
    strawberryController.dispose();
    pearController.dispose();
    super.dispose();
  }

List<Fruits> _fruits = List<Fruits>();  

  Future <List<Fruits>> fetchFruits() async {
    var url = 'https://raw.githubusercontent.com/marcellpaganini/mockdb/master/dbfruits.json';
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
  Widget build(BuildContext context) {
      fetchFruits().then((value){
         setState(() {
           _fruits.addAll(value);
         });
       });

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
        title: Text('Test'),
      ),
      body: ListView.builder(
        itemCount: _fruits.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10, left: 10, bottom: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                  child: _fruits[index].image != null ? Image.network(_fruits[index].image,) : Container(),
                  ),
                  Expanded(
                  child: TextField(
                   controller: index == 0 ? appleController : index == 1 ? bananaController : index == 2 ? grapeController : index == 3 ? pineappleController : index == 4 ? watermelonController : index == 5 ? lemmonController : index == 6 ? orangeController : index == 7 ? nectarineController : index == 8 ? strawberryController : index == 9 ? pearController: new TextEditingController(),
                   decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Fruit'
                    ),
                    ),
                  ),

                  Expanded(
                  child: Text(index == 0 ? appleController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '' : 'Good!' : index == 1 ? bananaController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '' : 'Good!' : index == 2 ? grapeController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '' : 'Good!' : index == 3 ? pineappleController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '' : 'Good!': index == 4 ? watermelonController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '' : 'Good!' : index == 5 ? lemmonController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '' : 'Good!' : index == 6 ? orangeController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '' : 'Good!' : index == 7 ? nectarineController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '' : 'Good!' : index == 8 ? strawberryController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '' : 'Good!' : index == 9 ? pearController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '' : 'Good!' : 'error'),
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


//---------------------------------------------



class FruitListDisplay extends StatefulWidget {
  @override
  _FruitListDisplayState createState() => _FruitListDisplayState();
}

class _FruitListDisplayState extends State<FruitListDisplay> {
  List<String> listItems = [];
  final TextEditingController tCtrl = new TextEditingController();

  List<Fruits> _fruits = List<Fruits>();  

  Future <List<Fruits>> fetchFruits() async {
    var url = 'https://raw.githubusercontent.com/marcellpaganini/mockdb/master/dbfruits.json';
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
  Widget build(BuildContext context) {

    fetchFruits().then((value){
         setState(() {
           _fruits.addAll(value);
         });
       });

    return Scaffold(
         floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) =>FruitTestDisplay()),
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
          children: List.generate(_fruits.length, (index) {
            return Row(children:[
                  Expanded(
                  child: _fruits[index].image != null ? Image.network(_fruits[index].image,) : Container(),
                  ),
                  Expanded(
                  child: Text(_fruits[index].name),
                  ),
            ],
            );
          }
          ),
        ),        
     ),
     
    ); 
  }
}




class ColorListDisplay extends StatefulWidget {
  @override
  _ColorListDisplayState createState() => _ColorListDisplayState();
}

class _ColorListDisplayState extends State<ColorListDisplay> {
  List<String> listItems = [];
  final TextEditingController tCtrl = new TextEditingController();

  List<Fruits> _fruits = List<Fruits>();  

  Future <List<Fruits>> fetchFruits() async {
    var url = 'https://raw.githubusercontent.com/marcellpaganini/mockdb/master/dbfruits.json';
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
  Widget build(BuildContext context) {

    fetchFruits().then((value){
         setState(() {
           _fruits.addAll(value);
         });
       });

    return Scaffold(
         floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) =>FruitTestDisplay()),
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
          children: List.generate(_fruits.length, (index) {
            return Row(children:[
                  Expanded(
                  child: _fruits[index].image != null ? Image.network(_fruits[index].image,) : Container(),
                  ),
                  Expanded(
                  child: Text(_fruits[index].name),
                  ),
            ],
            );
            
          }
          ),
          
        ),
        
        
     ),
     
    ); 
  }
}


class AnimalListDisplay extends StatefulWidget {
  @override
  _AnimalListDisplayState createState() => _AnimalListDisplayState();
}

class _AnimalListDisplayState extends State<AnimalListDisplay> {
  List<String> listItems = [];
  final TextEditingController tCtrl = new TextEditingController();

  List<Fruits> _fruits = List<Fruits>();  

  Future <List<Fruits>> fetchFruits() async {
    var url = 'https://raw.githubusercontent.com/marcellpaganini/mockdb/master/dbfruits.json';
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
  Widget build(BuildContext context) {

    fetchFruits().then((value){
         setState(() {
           _fruits.addAll(value);
         });
       });

    return Scaffold(
         floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) =>FruitTestDisplay()),
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
          children: List.generate(_fruits.length, (index) {
            return Row(children:[
                  Expanded(
                  child: _fruits[index].image != null ? Image.network(_fruits[index].image,) : Container(),
                  ),
                  Expanded(
                  child: Text(_fruits[index].name),
                  ),
            ],
            );
            
          }
          ),
          
        ),
        
        
     ),
     
    ); 
  }
}


class ProfessionListDisplay extends StatefulWidget {
  @override
  _ProfessionListDisplayState createState() => _ProfessionListDisplayState();
}

class _ProfessionListDisplayState extends State<ProfessionListDisplay> {
  List<String> listItems = [];
  final TextEditingController tCtrl = new TextEditingController();

  List<Fruits> _fruits = List<Fruits>();  

  Future <List<Fruits>> fetchFruits() async {
    var url = 'https://raw.githubusercontent.com/marcellpaganini/mockdb/master/dbfruits.json';
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
  Widget build(BuildContext context) {

    fetchFruits().then((value){
         setState(() {
           _fruits.addAll(value);
         });
       });

    return Scaffold(
         floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) =>FruitTestDisplay()),
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
          children: List.generate(_fruits.length, (index) {
            return Row(children:[
                  Expanded(
                  child: _fruits[index].image != null ? Image.network(_fruits[index].image,) : Container(),
                  ),
                  Expanded(
                  child: Text(_fruits[index].name),
                  ),
            ],
            );
            
          }
          ),
          
        ),
        
        
     ),
     
    ); 
  }
}











