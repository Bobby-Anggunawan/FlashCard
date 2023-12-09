import 'package:flashcard/Config.dart';
import 'package:flashcard/Data/DatabaseTable.dart';
import 'package:flutter/material.dart';

import '../../Data/Deck.dart';

class DeckViewModel{

  // init view model. fetch data pertama kali
  DeckViewModel(){
    fetchDecks();
  }

  // diinit dengan data dummy
  ValueNotifier<List<Deck>> decks = ValueNotifier([
    Deck(1, "name1", "description 1", Icons.add.codePoint, true),
    Deck(2, "name2", "description 2", Icons.ac_unit.codePoint, false),
    Deck(3, "name3", "description 3", Icons.add_a_photo_rounded.codePoint, false),
    Deck(4, "name4", "description 4", Icons.abc_outlined.codePoint, true),
    Deck(5, "name5", "description 5", Icons.dashboard.codePoint, false),
  ]);

  Future<void> fetchDecks()async{
    if(Config.testUI_notUsingDB == false){
      decks.value = await DatabaseTable.tableDeck.getDeckList();
    }
  }
}