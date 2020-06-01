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