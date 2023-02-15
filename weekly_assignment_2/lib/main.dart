import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIGMobile Weekly Assignment 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'SIGMobile Week 2'),
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
  // Create a text controller. Later, use it to retrieve the
  // current value of the TextField.
  final firstController = TextEditingController();
  final secondController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    firstController.dispose();
    secondController.dispose();
    super.dispose();
  }

  String _greeting = "";
  String _firstName = "";
  String _lastName = "";

  void _updateGreeting() {
    setState(() {
      _firstName = firstController.text;
      _lastName = secondController.text;
      _greeting = "Hello $_firstName $_lastName";
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
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: firstController,
                decoration: const InputDecoration(
                  label: Text("First Name"),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: secondController,
                decoration: const InputDecoration(
                  label: Text("Last Name"),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _greeting,
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateGreeting,
        tooltip: 'Submit',
        child: const Icon(Icons.add),
      ),
    );
  }
}
