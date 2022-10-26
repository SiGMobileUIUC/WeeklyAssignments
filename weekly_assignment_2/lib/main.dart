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
      title: 'Assignment #2',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const MyHomePage(title: 'Assignment #2'),
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
  String _first = "";
  String _second = "";
  String _fullname = "";

  void _updateFirst(String first) {
    setState(() {
      _first = first;
    });
  }

  void _updateSecond(String second) {
    setState(() {
      _second = second;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'First Name'),
                  onChanged: _updateFirst,
                )),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'Last Name'),
                  onChanged: _updateSecond,
                )),
            Text(_fullname.isNotEmpty ? 'Hello $_fullname' : '',
                style: const TextStyle(fontSize: 20.0)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _fullname = '$_first $_second';
            });
          },
          child: const Icon(Icons.update)),
    );
  }
}
