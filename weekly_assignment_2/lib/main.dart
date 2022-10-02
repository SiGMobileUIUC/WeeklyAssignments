import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name Concatenation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  String firstNameTemp = '';
  String lastNameTemp = '';
  String firstName = '';
  String lastName = '';

  void changeNameCounter() {
    setState(() {
      firstName = firstNameTemp;
      lastName = lastNameTemp;
      _counter++;
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Divider(),
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First name',
              ),
              onChanged: (text) {
                setState(() {
                  firstNameTemp = text;
                });
              },
            ),
            Divider(),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Last Name',
              ),
              onChanged: (text) {
                setState(
                  () {
                    lastNameTemp = text;
                  },
                );
              },
            ),
            Divider(),
            if (_counter >= 1)
              Text(
                'Hello $firstName $lastName',
                style: Theme.of(context).textTheme.headline4,
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeNameCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
