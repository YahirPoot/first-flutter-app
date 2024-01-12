import 'package:flutter/material.dart';
import 'package:namer_app/main.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //?FUNCION SNACKBAR
    void showSnackBar(BuildContext context, String text) {
      final snackBar = SnackBar(
        content: Text(text),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    var appState = context.watch<MyAppState>();
    if (appState.favorites.isEmpty) {
      return Center(
        child: Text(
          "List is empty",
        ),
      );
    }
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            children: [
              for (var pair in appState.favorites)
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      appState.removeFavorites(pair);
                      showSnackBar(context, 'Remove ${pair.asCamelCase} your Favorites List');
                    },
                  ),
                  title: Text(pair.asCamelCase),
                )
            ],
          );
        },
      ),
    );
  }
}
