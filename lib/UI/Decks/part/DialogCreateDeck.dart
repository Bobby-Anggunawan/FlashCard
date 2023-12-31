import "package:carassius_blueprint/carassius_blueprint.dart";
import "package:flashcard/Data/DatabaseTable.dart";
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

  final TextEditingController _namaDeck = TextEditingController();
  final TextEditingController _deskripsiDeck = TextEditingController();
  final ValueNotifier<int?> _iconTerpilih = ValueNotifier(null);
  final ValueNotifier<bool> _isDeckInCardMode = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(Icons.add),
      title: Text("Buat Deck Baru"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _namaDeck,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nama Deck',
            ),
          ),
          TextField(
            controller: _deskripsiDeck,
            maxLines: 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Deskripsi Deck',
            ),
          ),

          DropdownMenu(
            onSelected: (newValue){
              _iconTerpilih.value = newValue?.codePoint;
            },
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
          ),

          ValueListenableBuilder(
              valueListenable: _isDeckInCardMode,
              builder: (context, value, child){
                return Row(
                  children: [
                    Expanded(
                      child: SegmentedButton<bool>(
                        onSelectionChanged: (newValue){
                          _isDeckInCardMode.value = newValue.first;
                        },
                        selectedIcon: Icon(value ? Icons.style : Icons.label),
                        segments: [
                          ButtonSegment(
                            value: true,
                            label: Text("Card Mode"),
                            icon: Icon(Icons.style_outlined)
                          ),
                          ButtonSegment(
                              value: false,
                              label: Text("Label Mode"),
                              icon: Icon(Icons.label_outline)
                          ),
                        ],
                        selected: <bool>{value},
                      )
                    )
                  ],
                );
              }
          )
        ].koiAddSpacing(axis: Axis.vertical),
      ),
      actions: [
        TextButton(
          child: Text("Batal"),
          onPressed: (){
            Navigator.of(context).pop();
          }
        ),
        TextButton(
            child: Text("Ok"),
            onPressed: (){
              DatabaseTable.tableDeck.createNewDeck(_namaDeck.text, _deskripsiDeck.text, _iconTerpilih.value, _isDeckInCardMode.value)
                  .then((value){
                    KoiScaffold.showToast("Deck ${value.name} berhasil dibuat");
                    Navigator.of(context).pop();
                  }).onError((error, stackTrace){
                    KoiScaffold.showToast("Error saat membuat deck!!!");
                  });
            }
        ),
      ],
    );
  }
}
