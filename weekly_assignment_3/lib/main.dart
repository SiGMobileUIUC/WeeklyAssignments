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
      title: 'SIGMobile Weekly Assignment 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final List<int> _listTileIndices = List.generate(12, (index) => index);
  var listColors = const [
    Color.fromARGB(255, 233, 221, 114),
    Color.fromARGB(255, 247, 181, 60),
    Color.fromARGB(255, 238, 109, 180),
    Color.fromRGBO(236, 138, 204, 1),
    Color.fromARGB(255, 208, 138, 218),
    Color.fromARGB(255, 169, 105, 243),
    Color.fromARGB(255, 136, 112, 243),
    Color.fromARGB(255, 115, 133, 236),
    Color.fromARGB(255, 121, 198, 233),
    Color.fromARGB(255, 155, 225, 247),
    Color.fromRGBO(138, 240, 201, 1),
    Color.fromARGB(255, 147, 235, 176),
  ];

  void _removeTileIndex(int index) {
    setState(() {
      _listTileIndices.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _listTileIndices.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          leading: CircleAvatar(
              backgroundColor: listColors[_listTileIndices[index]]),
          title: const Text('I am a ListTile'),
          subtitle: Text('Index: ${_listTileIndices[index]}'),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _removeTileIndex(index),
          ),
        ),
      ),
    );
  }
}
