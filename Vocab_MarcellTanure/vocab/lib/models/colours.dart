class Colours{
  String name;
  String image;

  Colours({this.name, this.image});

  Colours.fromJson(Map<String, dynamic> json){
    name = json['name'];
    image = json['image'];
  }
}