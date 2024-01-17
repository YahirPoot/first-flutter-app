import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namer_app/classes/heading_item.dart';
import 'package:namer_app/classes/lits_item.dart';
import 'package:namer_app/classes/message_item.dart';
import 'package:namer_app/screen/List/list_widgets.dart';
import 'package:namer_app/screen/favorites_pages.dart';
import 'package:namer_app/screen/desing/grid_page.dart';
import 'package:namer_app/screen/List/list_basic.dart';
import 'package:namer_app/screen/List/list_horizontal.dart';
import 'package:namer_app/screen/List/list_long.dart';
import 'package:namer_app/screen/List/list_spaced.dart';
import 'package:namer_app/screen/desing/scroll_view.dart';
import 'package:namer_app/screen/desing/tab_bar.dart';
import 'package:namer_app/screen/forms/form_valitate.dart';
import 'package:namer_app/widgets/history_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Namer App',
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var history = <WordPair>[];

  GlobalKey? historyListKey;

  void getNext() {
    history.insert(0, current);
    var animatedList = historyListKey!.currentState as AnimatedListState;
    animatedList.insertItem(0);
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite([WordPair? pair]) {
    pair = pair ?? current;
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }
    notifyListeners();
  }

  void removeFavorites(WordPair word) {
    favorites.remove(word);
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      case 2:
        page = TabBarDemo();
        break;
      case 3:
        page = ScrollViewDemo();
        break;
      case 4:
        page = ListHorizontal();
        break;
      case 5:
        page = GridList();
        break;
      case 6:
        page = BasicList();
        break;
      case 7:
        page = ListLong();
        break;
      case 8:
        page = ListSapced();
        break;
      case 9:
        final items = List<ListItem>.generate(
          100,
          (i) => i % 6 == 0
              ? HeadingItem('Heading $i')
              : MessageItem('Sender $i', 'Message body $i'),
        );
        page = MixedListPage(items: items);
        break;
      case 10:
        page = MyCustomForm();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          appBar: AppBar(
              leading: Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(Icons.menu),
            ),
          )),
          drawer: Drawer(
            child: SafeArea(
              child: ListView(
                children: [
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('Favorites'),
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.tab),
                    title: Text('Nab-Tab'),
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.list_alt_sharp),
                    title: Text('Custom Scroll View'),
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.list_alt_sharp),
                    title: Text('List Horizontal'),
                    onTap: () {
                      setState(() {
                        selectedIndex = 4;
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.list),
                    title: Text('List Grid'),
                    onTap: () {
                      setState(() {
                        selectedIndex = 5;
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.list),
                    title: Text('Basic List'),
                    onTap: () {
                      setState(() {
                        selectedIndex = 6;
                      });
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.list),
                    title: Text('Long List'),
                    onTap: () {
                      setState(() {
                        selectedIndex = 7;
                      });
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.list),
                    title: Text('List spaced'),
                    onTap: () {
                      setState(() {
                        selectedIndex = 8;
                      });
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.list),
                    title: Text('Mixed List'),
                    onTap: () {
                      setState(() {
                        selectedIndex = 9;
                      });
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.list),
                    title: Text('Form'),
                    onTap: () {
                      setState(() {
                        selectedIndex = 10;
                      });
                    },
                  ),
                  // ... Agrega más ListTile para cada página ...
                ],
              ),
            ),
          ),
          body: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: page,
          ));
    });
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
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
          BigCard(pair: pair),
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
                child: Text('Next'),
              ),
            ],
          ),
          Spacer(flex: 2)
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      elevation: 10,
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedSize(
          duration: Duration(milliseconds: 200),
          child: MergeSemantics(
              child: Wrap(
            children: [
              Text(
                pair.first,
                style: style.copyWith(fontWeight: FontWeight.w200),
              ),
              Text(
                pair.second,
                style: style.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          )),
        ),
      ),
    );
  }
}
