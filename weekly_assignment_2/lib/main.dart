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
  // Creating a flag variable to know when to update text
  bool _displayText = true;

  // Creating temp variables and then variables to set as the answers only after the button is pressed
  String _firstNameTemp = '';
  String _lastNameTemp = '';

  String _firstName = '';
  String _lastName = '';

  // Sets the name displayed on the screen to the temp name stored by the textField and sets the displayText variable to true
  void changeNameCounter() {
    setState(() {
      _firstName = _firstNameTemp;
      _lastName = _lastNameTemp;
      _displayText = true;
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
            // Created a divider between the top and the textfield
            const Divider(),
            // Text field is a stateful widget that has a real-time updating box in which you can use your keyboard to type words
            TextField(
              // Created decroation for the textField to have a more visible box as well as have a text indicating what the field is for
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name',
              ),
              // onChange requires a function with a parameter. The 'text' parameter is what is being typed and onChanged updates the temp variable with it in live time
              onChanged: (text) {
                setState(() {
                  _firstNameTemp = text;
                });
              },
            ),
            const Divider(),
            // Last name controller connected to a different text field to make it more distinct to users
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Last Name',
              ),
              onChanged: (text) {
                setState(
                  () {
                    _lastNameTemp = text;
                  },
                );
              },
            ),
            const Divider(),
            // Created condition outside of text widget so that the name isn't displayed when nothing has been input yet
            if (_displayText)
              // Displays text widget with the first and last name concatenated with string interpolation
              Text(
                'Hello $_firstName $_lastName',
                style: Theme.of(context).textTheme.headline4,
              ),
          ],
        ),
      ),
      // Floating action button used to update the name display as well as the counter only after being pressed
      floatingActionButton: FloatingActionButton(
        onPressed: changeNameCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
