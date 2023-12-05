import 'package:carassius_blueprint/carassius_blueprint.dart';
import 'package:flashcard/UI/Decks/DecksPage.dart';
import 'package:flashcard/UI/SplashPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KoiScaffold(
        routes: KoiScaffoldRoute
            .baseRoute(SplashPage())
            .addRoutes("/decks", DecksPage())
        ,
        themeColor: ThemeColor.autoGenerateFromColor(Colors.black87)
    );
  }
}
