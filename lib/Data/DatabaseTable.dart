import 'package:flashcard/Data/Deck.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseTable{

  static const String dbName = "flash_card";
  static const String tableDeck = "deck";

  // seharusnya aman diakses langsung karena kalau belum di init, aplikasi tidak akan keluar dari splash screen
  static late Database db;

  bool _belumInitDB = true;
  Future<void> initDB()async{
    if(_belumInitDB){
      db = await openDatabase(
          '${dbName}.db',
          version: 1,
          onCreate: (db, version)async{
            // start-buat tabel saat database pertama dibuat
            await deck.createTable(db);
            // end---buat tabel saat database pertama dibuat
          }
      );
    }
    _belumInitDB = false;
  }

  final DeckDB deck = DeckDB(tableDeck);
}