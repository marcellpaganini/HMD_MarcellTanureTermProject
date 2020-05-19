class Fruits{
  String name;
  String image;

  Fruits({this.name, this.image});

  Fruits.fromJson(Map<String, dynamic> json){
    name = json['name'];
    image = json['thumbnailUrl'];
  }
  
}

class Albums{
  int id;
  String title;
  String thumbnailUrl;  

  Albums({this.thumbnailUrl, this.id, this.title});

  Albums.fromJson(Map<String, dynamic> json){
    thumbnailUrl = json['thumbnailUrl'];
    id = json['id'];
    title = json['title'];
  }
  
}