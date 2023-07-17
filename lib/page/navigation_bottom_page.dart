import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_tutorial/todo_app_state.dart';

class NavigationBottomPage extends StatelessWidget {
  const NavigationBottomPage({
    super.key,
    required this.selectedIndex,
    required this.appState,
  });

  final int selectedIndex;
  final TodoAppState appState;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: (value){
        appState.setIndex(value);
      },
    );
  }
}