class User{

  String ? userId;
  String  ? name;

  User({this.name, this.userId});

  Map<String ,dynamic> toJson()=>{
   'userId':this.userId,
    'name':this.name
    };

fromJson(dynamic parsedJson){
  this.userId = parsedJson['userId'] ?? '';
  this.name = parsedJson['name'] ?? '';
}

}