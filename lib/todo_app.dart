import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_tutorial/page/navigation_bottom_page.dart';
import 'package:todo_tutorial/page/navigation_rail_page.dart';
import 'package:todo_tutorial/todo_app_state.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<TodoAppState>();
    Widget page = appState.selectPage();
    var selectedIndex = appState.selectedIndex;
    var colorScheme = Theme.of(context).colorScheme;

    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 450) {
        return Column(children: [
          Expanded(child: mainArea),
          SafeArea(
            child: NavigationBottomPage(
              selectedIndex: selectedIndex,
              appState: appState,
            ),
          ),
        ]);
      } else {
        return Row(
          children: [
            SafeArea(
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
                child: NavigationRailPage(
                  selectedIndex: selectedIndex,
                  appState: appState,
                  constraints: constraints,
                ),
              ),
            ),
            Expanded(child: mainArea),
          ],
        );
      }
    }));
  }
}
