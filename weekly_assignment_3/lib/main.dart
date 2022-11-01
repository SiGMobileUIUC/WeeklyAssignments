import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return (MaterialApp(
      title: 'Weekly Assignment 3',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Weekly Assignment 3'),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  var listTile = List<int>.generate(12, (int index) => index, growable: true);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: listTile.length,
          itemBuilder: (BuildContext context, int index) {
            return (ListTile(
              leading: const Icon(Icons.person),
              title: const Text('I am a ListTile'),
              subtitle: Text('Index ${listTile[index]}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    listTile.removeAt(index);
                  });
                },
              ),
            ));
          },
        ),
      ),
    ));
  }
}
