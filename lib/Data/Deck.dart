import 'package:flashcard/Data/DatabaseTable.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Deck{
  late int id;
  late String name;
  String? description;
  int? icon;
  late bool isDeckInCardMode;

  Deck(int _id, String _name, String? _description, int? _icon, bool _isDeckInCardMode){
    id = _id;
    name = _name;
    description = _description;
    icon = _icon;
    isDeckInCardMode = _isDeckInCardMode;
  }
}

/// **NOTE** kalo mau akses, dari *DatabaseTable* saja
class DeckDB{
  late String tableName;
  late Database db;
  DeckDB(String _tableName, Database _db){
    tableName = _tableName;
    db = _db;
  }

  Future<void> createTable(Database db)async{

    /*
    * PENJELASAN KOLOM
    * - id : id
    * - name : nama card
    * - description : deskripsi card
    * - icon : icon yang digunakan di daftar card. diambil dari enum icons, misalnya icon add (Icons.add.codePoint)
    * - isDeckInCardMode : boolean. Kalau true, card di dalamnya akan ditampilkan dengan ukuran full dengan gambarnya. kalau false, card didalamnya hanya menampilkan teks saja seperti design aplikasi LUCIOLA di figma
    * */

    await db.execute("CREATE TABLE ${tableName} (id BIGINT PRIMARY KEY, name TEXT, description TEXT, icon INTEGER, isDeckInCardMode INTEGER)");
  }

  // return item yang barusaja di insert beserta id barunya
  Future<Deck> createNewDeck(String name, String? description, int? icon, bool isDeckInCardMode)async{
    var build = {
      "name": name,
      "description": description,
      "icon": icon,
      "isDeckInCardMode": isDeckInCardMode ? 1 : 0
    };
    var id = await db.insert(tableName, build);

    return Deck(id, name, description, icon, isDeckInCardMode);
  }

  Future<List<Deck>> getDeckList()async{
    var result = await db.query(tableName);

    return List.generate(result.length, (index){
      return Deck(
          result[index]["id"] as int,
          result[index]["name"] as String,
          result[index]["description"] as String?,
          result[index]["icon"] as int?,
          result[index]["isDeckInCardMode"] as bool,
      );
    });
  }
}