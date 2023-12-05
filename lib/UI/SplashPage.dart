import "package:carassius_blueprint/pages/KoiPageSplash.dart";
import "package:flutter/material.dart";

import "../Data/DatabaseTable.dart";

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KoiPageSplash(
      initialization: (BuildContext context)async{
        await DatabaseTable().initDB();

        //redirrect ke halaman daftar deck
        Navigator.of(context).pushNamed("/decks");
      },
    );
  }
}
