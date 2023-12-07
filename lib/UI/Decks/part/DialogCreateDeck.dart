import "package:carassius_blueprint/carassius_blueprint.dart";
import "package:flutter/material.dart";

class DialogCreateDeck extends StatelessWidget {
  DialogCreateDeck({Key? key}) : super(key: key);

  final Map<IconData, String> availableIcons = {
    Icons.close: "Close",
    Icons.check: "Check",
    Icons.radio_button_unchecked: "Radio Button Unchecked",
    Icons.block: "Block",
    Icons.alarm: "Alarm",
    Icons.favorite: "Favorite",
    Icons.star: "Star",
    Icons.key: "Key",
  };

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(Icons.add),
      title: Text("Buat Deck Baru"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nama Deck',
            ),
          ),
          TextField(
            maxLines: 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Deskripsi Deck',
            ),
          ),

          DropdownMenu(
            label: Text("Icon Deck"),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(),
            ),
            dropdownMenuEntries: List.generate(availableIcons.length, (index){
              return DropdownMenuEntry(
                  leadingIcon: Icon(availableIcons.keys.toList()[index]),
                  label: availableIcons.values.toList()[index],
                  value: availableIcons.keys.toList()[index]
              );
            }),
          )
        ].koiAddSpacing(axis: Axis.vertical),
      ),
      actions: [
        TextButton(
          child: Text("Batal"),
          onPressed: (){}
        ),
        TextButton(
            child: Text("Ok"),
            onPressed: (){}
        ),
      ],
    );
  }
}
