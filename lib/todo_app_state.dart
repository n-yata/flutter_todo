import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:todo_tutorial/page/favorites_page.dart';
import 'package:todo_tutorial/page/generator_page.dart';

class TodoAppState extends ChangeNotifier{
  var current = WordPair.random();
  var history = <WordPair>[];
  var favorites = <WordPair>[];
  var selectedIndex = 0;

  GlobalKey? historyListKey;

  void getNext(){
    history.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFavorite([WordPair? pair]){
    pair = pair ?? current;
    if(favorites.contains(pair)){
      favorites.remove(pair);
    }else{
      favorites.add(pair);
    }
    notifyListeners();
  }

  void removeFavorite(WordPair pair){
    favorites.remove(pair);
    notifyListeners();
  }

  void setIndex(var index){
    selectedIndex = index;
    notifyListeners();
  }

  Widget selectPage(){
    switch (selectedIndex) {
      case 0:
        return GeneratorPage();
      case 1:
        return FavoritesPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
  }
}