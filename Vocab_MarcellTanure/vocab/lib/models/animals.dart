class Animals{
  String name;
  String image;

  Animals({this.name, this.image});

  Animals.fromJson(Map<String, dynamic> json){
    name = json['name'];
    image = json['image'];
  }
}