import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Home Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String _firstName = '';
  String _lastName = '';
  String _displayedText = '';

  void _onSubmit() {
    if (_firstName.isNotEmpty && _lastName.isNotEmpty) {
      setState(() {
        _displayedText = 'Hello $_firstName $_lastName';
      });
    }
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
            const Divider(),
            TextField(
              onChanged: (text) {
                setState(() {
                  _firstName = text;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('First name'),
              ),
            ),
            const Divider(),
            TextField(
              onChanged: (text) {
                setState(() {
                  _lastName = text;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Last name'),
              ),
            ),
            const Divider(),
            Text(
              _displayedText,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onSubmit,
        tooltip: 'submit',
        child: const Icon(Icons.add),
      ),
    );
  }
}
