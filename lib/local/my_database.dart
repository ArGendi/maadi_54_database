import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase{
  Future<Database> initDB() async{
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, "abdo.db"),
      version: 1,
      onCreate: (db, version){
        db.execute("CREATE TABLE contacts(name TEXT, phone TEXT)");
        // db.execute("CREATE TABLE notes(title TEXT, content TEXT)");
      }
    );
  }

  void insert(String name, String phone) async{ // abdo , 012416436516
    var db = await initDB();
    db.insert("contacts", {
      "name": name,
      "phone": phone,
    });
  }

  void delete(String phone) async{
    var db = await initDB();
    db.delete("contacts" , where: "phone = ?", whereArgs: [phone]);
  }

  void update(String newName, String oldPhone, String newPhone) async{
    var db = await initDB();
    db.update("contacts", { "name": newName, "phone": newPhone }, where: "phone = ?", whereArgs: [oldPhone]);
  }

  Future< List<Map<String, dynamic>> > getData() async{
    var db = await initDB();
    var data = await db.query("contacts");
    return data;
  }

}