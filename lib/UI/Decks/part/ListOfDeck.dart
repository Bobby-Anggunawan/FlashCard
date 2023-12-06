import "package:flashcard/UI/Decks/part/DeckItem.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "../../../Data/Deck.dart";

//TODO 1: atur color untuk widget DeckItem
//TODO 2: buat atur isExpanded untuk widget DeckItem

class ListOfDeck extends StatelessWidget {
  const ListOfDeck({Key? key, required this.listOfDeck}) : super(key: key);

  final ValueListenable<List<Deck>> listOfDeck;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: listOfDeck,
      builder: (BuildContext context, value, Widget? child) {
        return ListView(
          children: List.generate(value.length, (index){
            return DeckItem(
              content: value[index],
              isExpanded: true,
              color: index%2==0? Colors.purple : Colors.indigo,
            );
          }),
        );
      },
    );
  }
}
