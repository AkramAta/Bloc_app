import 'package:bloc_app/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppRouter {
  Route? generateRoute (RouteSettings settings){
    switch (settings.name) {
      case "/":
      return MaterialPageRoute(builder: (_) => CharactersScreen());
        

    }
  }
}