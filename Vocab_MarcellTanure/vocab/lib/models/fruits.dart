class Fruits{
  String name;
  String image;

  Fruits({this.name, this.image});

  Fruits.fromJson(Map<String, dynamic> json){
    name = json['name'];
    image = json['image'];
  }
}

