import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Weekly Assignment 3'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List to keep track of which indices are still in the list view
  final List<int> _listTileIndices = List.generate(12, (index) => index);

  // Function to remove the list tile at the given index
  void _removeAtIndex(int listTileIndexToRemove) {
    // Using setState to tell Flutter to rebuild the widget and UI
    setState(() {
      // Remove the listTileIndex at the given index
      _listTileIndices.removeAt(listTileIndexToRemove);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // Using a ListView.builder widget so that we can use the index of each ListTile being built to customized that
      // ListTile
      body: ListView.builder(
        // This anonymous function gives you an updated BuildContext (you don't have to worry about that right now but
        // you can look up what it is) and the index of the current item being built. It has to return a Widget which
        // the ListView will use to create its children
        itemBuilder: (context, listTileIndex) => ListTile(
          // Widget used to create the circle at the start of the ListTile. Can be used for other things such as
          leading: CircleAvatar(backgroundColor: Colors.primaries[listTileIndex % Colors.primaries.length]),
          // The title text of the ListTile
          title: const Text('I am a ListTile'),
          // The text below the title of the ListTile
          subtitle: Text('Index: ${_listTileIndices[listTileIndex]}'),
          // The delete button at the end of the ListTile
          trailing: IconButton(
            // Call the _removeAtIndex function when button is pressed with the index of the current ListTile
            onPressed: () {
              _removeAtIndex(listTileIndex);
            },
            icon: const Icon(Icons.delete),
          ),
        ),
        // Tells the ListView how many ListTiles to build
        itemCount: _listTileIndices.length,
      ),
    );
  }
}
