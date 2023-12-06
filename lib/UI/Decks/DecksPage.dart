import "package:flashcard/UI/Decks/DeckViewModel.dart";
import "package:flashcard/UI/Decks/part/ListOfDeck.dart";
import "package:flutter/material.dart";

class DecksPage extends StatelessWidget {
  DecksPage({Key? key}) : super(key: key);

  final DeckViewModel viewModel = DeckViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListOfDeck(listOfDeck: viewModel.decks,),
    );
  }
}
