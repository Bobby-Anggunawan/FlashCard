import 'package:flashcard/Data/DatabaseTable.dart';
import 'package:sqflite/sqflite.dart';

class Deck{
  late int id;
  late String name;
  String? description;
  int? icon;

  Deck(int _id, String _name, String? _description, int? _icon){
    id = _id;
    name = _name;
    description = _description;
    icon = _icon;
  }
}

/// **NOTE** kalo mau akses, dari *DatabaseTable* saja
class DeckDB{
  late String tableName;
  DeckDB(_tableName){
    tableName = _tableName;
  }

  Future<void> createTable(Database db)async{
    await db.execute("CREATE TABLE ${tableName} (id BIGINT PRIMARY KEY, name TEXT, description TEXT, icon INTEGER)");
  }

  // return item yang barusaja di insert beserta id barunya
  Future<Deck> createNewDeck(String name, String? description, int? icon)async{
    var build = {
      "name": name,
      "description": description,
      "icon": icon
    };
    var id = await DatabaseTable.db.insert(tableName, build);

    return Deck(id, name, description, icon);
  }

  Future<List<Deck>> getDeckList()async{
    var result = await DatabaseTable.db.query(tableName);

    return List.generate(result.length, (index){
      return Deck(
          result[index]["id"] as int,
          result[index]["name"] as String,
          result[index]["description"] as String?,
          result[index]["icon"] as int?
      );
    });
  }
}