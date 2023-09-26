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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'FizzBuzz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String _fizzbuzz = "fizzbuzz";

  void _incrementCounter() {
    setState(() {
      _counter++;
      _checkFizzBuzz();
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _checkFizzBuzz();
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
      _checkFizzBuzz();
    });
  }

  void _checkFizzBuzz() {
    if (_counter % 3 == 0 && _counter % 5 == 0) {
      setState(() {
        _fizzbuzz = "fizzbuzz";
      });
    } else if (_counter % 3 == 0) {
      setState(() {
        _fizzbuzz = "fizz";
      });
    } else if (_counter % 5 == 0) {
      setState(() {
        _fizzbuzz = "buzz";
      });
    } else {
      setState(() {
        _fizzbuzz = "--";
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
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              _fizzbuzz,
              style: Theme.of(context).textTheme.headline4,
            ),
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FloatingActionButton(
                    onPressed: _decrementCounter,
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  )
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton(
                    onPressed: _reset,
                    tooltip: 'Reset',
                    child: const Center(child: Text('0', style: TextStyle(color: Colors.white))),
                  )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
