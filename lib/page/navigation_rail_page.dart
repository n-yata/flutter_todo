import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_tutorial/todo_app_state.dart';

class NavigationRailPage extends StatelessWidget {
  const NavigationRailPage({
    super.key,
    required this.selectedIndex,
    required this.appState,
    required this.constraints,
  });

  final int selectedIndex;
  final TodoAppState appState;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      extended: constraints.maxWidth >= 600,
      destinations: [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.favorite),
          label: Text('Favorites'),
        ),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: (value) {
        appState.setIndex(value);
      },
    );
  }
}