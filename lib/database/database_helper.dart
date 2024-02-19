import 'package:movies_app/database/model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String columnId = 'id';
const String columnName = 'name';
const String columnEmail = 'numbemailer';
const String columnPassword = 'password';
const String tableName = 'login_register';

class Login_Register_Helper{
  late Database db;
  static final Login_Register_Helper instance = Login_Register_Helper._internal();
  factory Login_Register_Helper()=> instance;

  Login_Register_Helper._internal();

  Future open() async{
    String path = await getDatabasesPath();
    String databaseName = 'login_register.db';
    db = await openDatabase(
      join(path , databaseName),
      version: 1,
      onCreate: (Database db,int version) async {
        await db.execute('''
            create table $tableName (
              $columnId integer primary key autoincrement,
              $columnName text not null,
              $columnEmail text not null,
              $columnPassword text not null
            )
      ''');
      },
    );
  }

  Future<Login_Register> insertUser(Login_Register user) async {
    user.id = await db.insert(tableName, user.toMap());
    return user;
  }

  // will use in future when signout
  Future<int> deleteContact(int id) => db.delete(tableName ,where: '$columnId = ?' ,whereArgs: [id]);

  Future<List<Login_Register>> getUsers() async {
    List<Map<String ,dynamic>> database = await db.query(tableName);
    if(database.isEmpty) return [];
    List<Login_Register> users =[];
    for(var element in database){
      users.add(Login_Register.fromMap(element));
    }
    return users;
  }

  Future close() => db.close();


}