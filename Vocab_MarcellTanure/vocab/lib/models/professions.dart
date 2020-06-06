class Professions{
  String name;
  String image;

  Professions({this.name, this.image});

  Professions.fromJson(Map<String, dynamic> json){
    name = json['name'];
    image = json['image'];
  }
}