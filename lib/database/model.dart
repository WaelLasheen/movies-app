import 'package:movies_app/database/database_helper.dart';

class Login_Register{
  int? id;
  late String name;
  late String email;
  late String password;

  Login_Register({this.id,required this.name, required this.email, required this.password});
  Login_Register.fromMap(Map<String,dynamic> map){
    if(map[columnId] != null) id = map[columnId];
    name = map[columnName];
    email = map[columnEmail];
    password = map[columnPassword];
  }

  Map<String , dynamic> toMap(){
    Map<String , dynamic> map = {};
    if (id != null) map[columnId] = id;
    map[columnName] = name;
    map[columnEmail] = email;
    map[columnPassword] = password;
    return map;
  }

}