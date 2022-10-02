import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FizzBuzz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'FizzBuzz'),
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
  //Counter to keep track of the value on the screen
  int _counter = 0;
   
  //Function to increment that value of _counter by 1 and display that updated value on the screen
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  
  //Function to subtract that value of _counter by 1 and display that updated value on the screen
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  //Function to set the value of _counter to 0 and display the updated value on the screen
  void _zeroCounter() {
    setState(() {
      _counter = 0;
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
          //Children is a list of widget that we are organizing verically in the column
          children: <Widget>[
            //This a text widget to display the updating value of _counter
            Text(
              //String interprelation is used by haveing a $ in front of _counter to display the updating counter in a text widget
              '$_counter',
              //Using default themes that come with flutter
              style: Theme.of(context).textTheme.headline4,
            ),
            //Text widget to display either 'fizz', 'buzz', or 'fizzbuzz' depending on the value of _counter
            Text((() {
              //Created a function inside the Text widget to return certain values to display
              if (_counter % 5 == 0 && _counter % 3 == 0) {
                //If _counter is divisible by 5 & 3 it displays 'fizzbuzz'
                return "fizzbuzz";
              } else if (_counter % 3 == 0) {
                //If _counter is divisible by only 3 it displays 'fizz'
                return "fizz";
              } else if (_counter % 5 == 0) {
                //If _counter is divisible by only 5 it displays 'buzz'
                return "buzz";
              } else
                return "----";
            })()),
            //Divided to create space between the text displaying fizzbuzz and the buttons
            Divider(),
            //Row to organize the buttons horizontally
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //Added space between the buttons on the main axis(horizontal)
              children: [
                //Made 3 floating action buttons for easier setup
                FloatingActionButton(
                  //When the button with a 0 symbol is pressed it calls the _zeroCounter function that sets the number of screen to 0
                  onPressed: _zeroCounter,
                  '''Tooltip is not used here but it's the label that the system uses to display what a button does when you hold it or 
                  what a phone says when it reads everything on screen for blind people in the disability mode in flutter
                  '''
                  tooltip: 'Zero',
                  //Used default icons that come with flutter through Icons.add, or Icons.remove, etc.
                  child: const Icon(Icons.exposure_zero),
                ),
                FloatingActionButton(
                   //When the button with a '-' symbol is pressed it calls the _decrementCounter function that decreases the number of the screen by 1
                  onPressed: _decrementCounter,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  //When the button with a '+' symbol is pressed it calls the _decrementCounter function that increases the number of the screen by 1
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
