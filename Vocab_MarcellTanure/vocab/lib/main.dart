import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './models/fruits.dart';
import './models/colours.dart';
import './models/animals.dart';
import './models/professions.dart';
import './models/routes.dart';



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
        body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/vocabBackground.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                new RaisedButton(
                  onPressed:(){
                    Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>Menu()),
                    );
                  },
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                  padding: const EdgeInsets.all(10.0),
                  child:
                  const Text('START', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
            ),
          ),  
    );
  }
}

//-------------------------------------------------------

final List<String> entries = <String>['Fruits', 'Colors', 'Animals', 'Professions'];
final List<int> colorCodes = <int>[600, 300, 600, 300];
List<Widget> buttons = <Widget>[FruitListDisplay(), ColourListDisplay(), AnimalListDisplay(), ProfessionListDisplay()];

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




class ColourListDisplay extends StatefulWidget {
  @override
  _ColourListDisplayState createState() => _ColourListDisplayState();
}

class _ColourListDisplayState extends State<ColourListDisplay> {
  List<String> listItems = [];
  final TextEditingController tCtrl = new TextEditingController();

  List<Colours> _colours = List<Colours>();  

  Future <List<Colours>> fetchColours() async {
    var url = 'https://raw.githubusercontent.com/marcellpaganini/mockdb/master/dbcolors.json';
    var response = await http.get(url);

    var colours = List<Colours>();

    if(response.statusCode == 200){
      var responseColours = json.decode(response.body);

      for (var colour in responseColours){
        colours.add(Colours.fromJson(colour));
      }

    }
    return colours;
  }
  
  @override
  Widget build(BuildContext context) {

    fetchColours().then((value){
         setState(() {
           _colours.addAll(value);
         });
       });

    return Scaffold(
         floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) =>ColourTestDisplay()),
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
          children: List.generate(_colours.length, (index) {
            return Row(children:[
                  Container(
                    height: 90.0,
                    width: 90.0,
                    padding: EdgeInsets.only(top: 00.0, left: 00.0, right: 10.0),
                    child: Expanded(
                    child: _colours[index].image != null ? Container(
                      width: 30.0,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.grey,
                      ),
                      child: Image.network(_colours[index].image,)) : Container(),
                    ),
                  ),
                  Expanded(
                  child: Text(_colours[index].name),
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

  List<Animals> _animals = List<Animals>();  

  Future <List<Animals>> fetchAnimals() async {
    var url = 'https://raw.githubusercontent.com/marcellpaganini/mockdb/master/dbanimals.json';
    var response = await http.get(url);

    var animals = List<Animals>();

    if(response.statusCode == 200){
      var responseAnimals = json.decode(response.body);

      for (var animal in responseAnimals){
        animals.add(Animals.fromJson(animal));
      }

    }
    return animals;
  }
  
  @override
  Widget build(BuildContext context) {

    fetchAnimals().then((value){
         setState(() {
           _animals.addAll(value);
         });
       });

    return Scaffold(
         floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) =>AnimalTestDisplay()),
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
          children: List.generate(_animals.length, (index) {
            return Row(children:[
                  Expanded(
                  child: _animals[index].image != null ? Image.network(_animals[index].image,) : Container(),
                  ),
                  Expanded(
                  child: Text(_animals[index].name),
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

  List<Professions> _professions = List<Professions>();  

  Future <List<Professions>> fetchProfessions() async {
    var url = 'https://raw.githubusercontent.com/marcellpaganini/mockdb/master/dbprofessions.json';
    var response = await http.get(url);

    var professions = List<Professions>();

    if(response.statusCode == 200){
      var responseProfessions = json.decode(response.body);

      for (var profession in responseProfessions){
        professions.add(Professions.fromJson(profession));
      }

    }
    return professions;
  }
  
  @override
  Widget build(BuildContext context) {

    fetchProfessions().then((value){
         setState(() {
           _professions.addAll(value);
         });
       });

    return Scaffold(
         floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) =>ProfessionTestDisplay()),
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
          children: List.generate(_professions.length, (index) {
            return Row(children:[
                  Expanded(
                  child: _professions[index].image != null ? Image.network(_professions[index].image,) : Container(),
                  ),
                  Expanded(
                  child: Text(_professions[index].name),
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

//----------------------------------------------------------
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
                  child: Container(
                    height: 43.0,
                    child: TextField(
                     controller: index == 0 ? appleController : index == 1 ? bananaController : index == 2 ? grapeController : index == 3 ? pineappleController : index == 4 ? watermelonController : index == 5 ? lemmonController : index == 6 ? orangeController : index == 7 ? nectarineController : index == 8 ? strawberryController : index == 9 ? pearController: new TextEditingController(),
                     decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Fruit'
                      ),
                      ),
                  ),
                  ),

                  Expanded(
                  child: Text(index == 0 ? appleController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '     ...' : '      Good!' : index == 1 ? bananaController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '     ...' : '      Good!' : index == 2 ? grapeController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '      ...' : '      Good!' : index == 3 ? pineappleController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '      ...' : '      Good!': index == 4 ? watermelonController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '      ...' : '      Good!' : index == 5 ? lemmonController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '     ...' : '      Good!' : index == 6 ? orangeController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '     ...' : '      Good!' : index == 7 ? nectarineController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '      ...' : '      Good!' : index == 8 ? strawberryController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '     ...' : '      Good!' : index == 9 ? pearController.text.toUpperCase().trim() != _fruits[index].name.toUpperCase() ? '     ...' : '      Good!' : 'error'),
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




class ColourTestDisplay extends StatefulWidget {
  ColourTestDisplay({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ColourTestDisplayState createState() => _ColourTestDisplayState();
}

class _ColourTestDisplayState extends State<ColourTestDisplay> {

final redController = TextEditingController();
final yellowController = TextEditingController();
final greenController = TextEditingController();
final blueController = TextEditingController();
final brownController = TextEditingController();
final orangeController = TextEditingController();
final grayController = TextEditingController();
final blackController = TextEditingController();
final purpleController = TextEditingController();
final whiteController = TextEditingController();

@override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    redController.dispose();
    yellowController.dispose();
    greenController.dispose();
    blueController.dispose();
    brownController.dispose();
    orangeController.dispose();
    grayController.dispose();
    blackController.dispose();
    purpleController.dispose();
    whiteController.dispose();
    super.dispose();
  }

List<Colours> _colours = List<Colours>();  

  Future <List<Colours>> fetchColours() async {
    var url = 'https://raw.githubusercontent.com/marcellpaganini/mockdb/master/dbcolors.json';
    var response = await http.get(url);

    var colours = List<Colours>();

    if(response.statusCode == 200){
      var responseColours = json.decode(response.body);

      for (var colour in responseColours){
        colours.add(Colours.fromJson(colour));
      }

    }
    return colours;
  }


    
    
  

  @override
  Widget build(BuildContext context) {
      fetchColours().then((value){
         setState(() {
           _colours.addAll(value);
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
        itemCount: _colours.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10, left: 10, bottom: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                  child: _colours[index].image != null ? Container(width:80.0, height:80.0, child: Image.network(_colours[index].image,)) : Container(),
                  ),
                  Expanded(
                  child: Container(
                    height: 43.0,
                    child: TextField(
                     controller: index == 0 ? redController : index == 1 ? yellowController : index == 2 ? greenController : index == 3 ? blueController : index == 4 ? brownController : index == 5 ? orangeController : index == 6 ? grayController : index == 7 ? blackController : index == 8 ? purpleController : index == 9 ? whiteController: new TextEditingController(),
                     decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Color'
                      ),
                      ),
                  ),
                  ),

                  Expanded(
                  child: Text(index == 0 ? redController.text.toUpperCase().trim() != _colours[index].name.toUpperCase() ? '      ...' : '      Good!' : index == 1 ? yellowController.text.toUpperCase().trim() != _colours[index].name.toUpperCase() ? '      ...' : '      Good!' : index == 2 ? greenController.text.toUpperCase().trim() != _colours[index].name.toUpperCase() ? '     ...' : '      Good!' : index == 3 ? blueController.text.toUpperCase().trim() != _colours[index].name.toUpperCase() ? '      ...' : '      Good!': index == 4 ? brownController.text.toUpperCase().trim() != _colours[index].name.toUpperCase() ? '      ...' : '      Good!' : index == 5 ? orangeController.text.toUpperCase().trim() != _colours[index].name.toUpperCase() ? '      ...' : '      Good!' : index == 6 ? grayController.text.toUpperCase().trim() != _colours[index].name.toUpperCase() ? '      ...' : '      Good!' : index == 7 ? blackController.text.toUpperCase().trim() != _colours[index].name.toUpperCase() ? '     ...' : '      Good!' : index == 8 ? purpleController.text.toUpperCase().trim() != _colours[index].name.toUpperCase() ? '      ...' : '      Good!' : index == 9 ? whiteController.text.toUpperCase().trim() != _colours[index].name.toUpperCase() ? '     ...' : '      Good!' : 'error'),
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



class AnimalTestDisplay extends StatefulWidget {
  AnimalTestDisplay({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnimalTestDisplayState createState() => _AnimalTestDisplayState();
}

class _AnimalTestDisplayState extends State<AnimalTestDisplay> {

final dogController = TextEditingController();
final horseController = TextEditingController();
final catController = TextEditingController();
final monkeyController = TextEditingController();
final snakeController = TextEditingController();
final fishController = TextEditingController();
final birdController = TextEditingController();
final mouseController = TextEditingController();
final spiderController = TextEditingController();
final frogController = TextEditingController();

@override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    dogController.dispose();
    horseController.dispose();
    catController.dispose();
    monkeyController.dispose();
    snakeController.dispose();
    fishController.dispose();
    birdController.dispose();
    mouseController.dispose();
    spiderController.dispose();
    frogController.dispose();
    super.dispose();
  }

List<Animals> _animals = List<Animals>();  

  Future <List<Animals>> fetchAnimals() async {
    var url = 'https://raw.githubusercontent.com/marcellpaganini/mockdb/master/dbanimals.json';
    var response = await http.get(url);

    var animals = List<Animals>();

    if(response.statusCode == 200){
      var responseAnimals = json.decode(response.body);

      for (var animal in responseAnimals){
        animals.add(Animals.fromJson(animal));
      }

    }
    return animals;
  }


    
    
  

  @override
  Widget build(BuildContext context) {
      fetchAnimals().then((value){
         setState(() {
           _animals.addAll(value);
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
        itemCount: _animals.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10, left: 10, bottom: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                  child: _animals[index].image != null ? Image.network(_animals[index].image,) : Container(),
                  ),
                  Expanded(
                  child: Container(
                    height: 43.0,
                    child: TextField(
                     controller: index == 0 ? dogController : index == 1 ? horseController : index == 2 ? catController : index == 3 ? monkeyController : index == 4 ? snakeController : index == 5 ? fishController : index == 6 ? birdController : index == 7 ? mouseController : index == 8 ? spiderController : index == 9 ? frogController: new TextEditingController(),
                     decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Animal'
                      ),
                      ),
                  ),
                  ),

                  Expanded(
                  child: Text(index == 0 ? dogController.text.toUpperCase().trim() != _animals[index].name.toUpperCase() ? '      ...' : '      Good!' : index == 1 ? horseController.text.toUpperCase().trim() != _animals[index].name.toUpperCase() ? '     ...' : '      Good!' : index == 2 ? catController.text.toUpperCase().trim() != _animals[index].name.toUpperCase() ? '     ...' : '      Good!' : index == 3 ? monkeyController.text.toUpperCase().trim() != _animals[index].name.toUpperCase() ? '      ...' : '      Good!': index == 4 ? snakeController.text.toUpperCase().trim() != _animals[index].name.toUpperCase() ? '      ...' : '      Good!' : index == 5 ? fishController.text.toUpperCase().trim() != _animals[index].name.toUpperCase() ? '      ...' : '      Good!' : index == 6 ? birdController.text.toUpperCase().trim() != _animals[index].name.toUpperCase() ? '      ...' : '      Good!' : index == 7 ? mouseController.text.toUpperCase().trim() != _animals[index].name.toUpperCase() ? '     ...' : '      Good!' : index == 8 ? spiderController.text.toUpperCase().trim() != _animals[index].name.toUpperCase() ? '      ...' : '      Good!' : index == 9 ? frogController.text.toUpperCase().trim() != _animals[index].name.toUpperCase() ? '      ...' : '      Good!' : 'error'),
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




class ProfessionTestDisplay extends StatefulWidget {
  ProfessionTestDisplay({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfessionTestDisplayState createState() => _ProfessionTestDisplayState();
}

class _ProfessionTestDisplayState extends State<ProfessionTestDisplay> {

final teacherController = TextEditingController();
final doctorController = TextEditingController();
final cookController = TextEditingController();
final astronautController = TextEditingController();
final policeOfficerController = TextEditingController();
final singerController = TextEditingController();
final athleteController = TextEditingController();
final dancerController = TextEditingController();
final scientistController = TextEditingController();
final actorController = TextEditingController();

@override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    teacherController.dispose();
    doctorController.dispose();
    cookController.dispose();
    astronautController.dispose();
    policeOfficerController.dispose();
    singerController.dispose();
    athleteController.dispose();
    dancerController.dispose();
    scientistController.dispose();
    actorController.dispose();
    super.dispose();
  }

List<Professions> _professions = List<Professions>();  

  Future <List<Professions>> fetchProfessions() async {
    var url = 'https://raw.githubusercontent.com/marcellpaganini/mockdb/master/dbprofessions.json';
    var response = await http.get(url);

    var professions = List<Professions>();

    if(response.statusCode == 200){
      var responseProfessions = json.decode(response.body);

      for (var profession in responseProfessions){
        professions.add(Professions.fromJson(profession));
      }

    }
    return professions;
  }


    
    
  

  @override
  Widget build(BuildContext context) {
      fetchProfessions().then((value){
         setState(() {
           _professions.addAll(value);
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
        itemCount: _professions.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10, left: 10, bottom: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                  child: _professions[index].image != null ? Image.network(_professions[index].image,) : Container(),
                  ),
                  Expanded(
                  child: Container(
                    height: 43.0,
                    child: TextField(
                     controller: index == 0 ? teacherController : index == 1 ? doctorController : index == 2 ? cookController : index == 3 ? astronautController : index == 4 ? policeOfficerController : index == 5 ? singerController : index == 6 ? athleteController : index == 7 ? dancerController : index == 8 ? scientistController : index == 9 ? actorController: new TextEditingController(),
                     decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Profession'
                      ),
                      ),
                  ),
                  ),

                  Expanded(
                  child: Text(index == 0 ? teacherController.text.toUpperCase().trim() != _professions[index].name.toUpperCase() ? '      ...' : '     Good!' : index == 1 ? doctorController.text.toUpperCase().trim() != _professions[index].name.toUpperCase() ? '     ...' : '      Good!' : index == 2 ? cookController.text.toUpperCase().trim() != _professions[index].name.toUpperCase() ? '      ...' : '      Good!' : index == 3 ? astronautController.text.toUpperCase().trim() != _professions[index].name.toUpperCase() ? '     ...' : '      Good!': index == 4 ? policeOfficerController.text.toUpperCase().trim() != _professions[index].name.toUpperCase() ? '      ...' : '      Good!' : index == 5 ? singerController.text.toUpperCase().trim() != _professions[index].name.toUpperCase() ? '      ...' : '      Good!' : index == 6 ? athleteController.text.toUpperCase().trim() != _professions[index].name.toUpperCase() ? '     ...' : '      Good!' : index == 7 ? dancerController.text.toUpperCase().trim() != _professions[index].name.toUpperCase() ? '      ...' : '      Good!' : index == 8 ? scientistController.text.toUpperCase().trim() != _professions[index].name.toUpperCase() ? '     ...' : '      Good!' : index == 9 ? actorController.text.toUpperCase().trim() != _professions[index].name.toUpperCase() ? '     ...' : '      Good!' : 'error'),
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