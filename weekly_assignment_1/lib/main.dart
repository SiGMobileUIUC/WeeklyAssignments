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
      title: 'SIGMobile Assignment 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'SIGMobile Assignment 1'),
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
  int _counter = 0;
  String _displayText = "fizzbuzz";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetToZero() {
    setState(() {
      _counter = 0;
    });
  }

  void _setText() {
    setState(() {
      _displayText = "";
      if (_counter % 3 == 0) {
        _displayText += "fizz";
      }
      if (_counter % 5 == 0) {
        _displayText += "buzz";
      }
      if (_displayText.isEmpty) {
        _displayText == "--";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _displayText,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _incrementCounter();
                    _setText();
                  },
                  label: const Text("increment"),
                  icon: const Icon(Icons.add),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    _resetToZero();
                    _setText();
                  },
                  label: const Text("reset"),
                  icon: const Icon(Icons.exposure_zero),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    _decrementCounter();
                    _setText();
                  },
                  label: const Text("decrement"),
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
