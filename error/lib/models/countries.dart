class Countries{
  String name;
  String capital;

  Countries({this.name, this.capital});

  Countries.fromJson(Map<String, dynamic> json){
    name = json['name'];
    capital = json['capital'];
  }
  
}