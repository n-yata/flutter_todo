import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_tutorial/big_card.dart';
import 'package:todo_tutorial/environment/environment_config.dart';
import 'package:todo_tutorial/history_list_view.dart';
import 'package:todo_tutorial/todo_app_state.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<TodoAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: HistoryListView(),
          ),
          SizedBox(height: 10),
          BigCard(
            pair: pair,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                // child: Text('Next'),
                child: Text(EnvironmentConfig.ENV_NAME),
              ),
            ],
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
