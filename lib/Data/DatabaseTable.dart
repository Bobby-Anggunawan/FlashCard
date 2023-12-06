import 'package:flashcard/Data/Deck.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseTable{

  static const String _dbName = "flash_card";
  static const String _tableDeck = "deck";

  // seharusnya aman diakses langsung karena kalau belum di init, aplikasi tidak akan keluar dari splash screen
  static late Database _db;

  bool _belumInitDB = true;
  Future<void> initDB()async{
    if(_belumInitDB){
      _db = await openDatabase(
          '${_dbName}.db',
          version: 1,
          onCreate: (db, version)async{
            // start-buat tabel saat database pertama dibuat
            await tableDeck.createTable(db);
            // end---buat tabel saat database pertama dibuat
          }
      );
    }
    _belumInitDB = false;
  }

  // daftar tabel di database ini
  static DeckDB tableDeck = DeckDB(_tableDeck, _db);
}