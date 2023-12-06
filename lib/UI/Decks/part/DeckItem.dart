import 'package:carassius_blueprint/carassius_blueprint.dart';
import 'package:flutter/material.dart';

import '../../../Data/Deck.dart';

class DeckItem extends StatelessWidget {
  const DeckItem({Key? key, required this.content, required this.isExpanded, required this.color}) : super(key: key);

  /// content yang ditampilkan di item ini
  final Deck content;
  /// apa item ini sedang expanded atau tidak
  final bool isExpanded;

  /// warna apa item ini
  final Color color;

  //tinggi card jika isExpanded == true
  final double tinggiExpanded = 150;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: isExpanded? tinggiExpanded : null,
      child: Center(
        child: Builder(builder: (context){
          if(isExpanded){
            return ListTile(
              leading: content.icon != null ? Icon(IconData(content.icon!, fontFamily: 'MaterialIcons')) : null,
              title: Text(content.name),
              subtitle: content.description != null ?
              Text(content.description!) :
              Text("~~Tidak ada deskripsi", style: TextStyle(
                  color: context.koiThemeColor.outline
              ),),
            );
          }
          else{
            return ListTile(
                leading: content.icon != null ? Icon(IconData(content.icon!, fontFamily: 'MaterialIcons')) : null,
                title: Text(content.name)
            );
          }
        },),
      ),
    );
  }
}
