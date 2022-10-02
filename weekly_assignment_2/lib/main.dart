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
  //Creating a counter to know when to update text
  int _counter = 0;
  '''Text Controllers are a variable we have to create to use TextFields 
  and for users to change the text and see the changes in real time
  '''
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  //Creating temp variables and then variables to set as the answers only after the button is pressed
  String firstNameTemp = '';
  String lastNameTemp = '';
  String firstName = '';
  String lastName = '';
  
  //Sets the name displayed on the screen to the temp name stored by the textField and increments the counter by 1
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
            //Created a divider between the top and the textfield
            Divider(),
            //Text field is a stateful widget that has a real-time updating box in which you can use your keyboard to type words
            TextField(
              //Connected the firstName controller to the parameter in Textfield as we need a different controller for each field
              controller: firstNameController,
              //Created decroation for the textField to have a more visible box as well as have a text indicating what the field is for
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name',
              ),
              //onChange requires a function with a parameter. The 'text' parameter is what is being typed and onChanged updates the temp variable with it in live time
              onChanged: (text) {
                setState(() {
                  firstNameTemp = text;
                });
              },
            ),
            Divider(),
            //Last name controller connected to a different text field to make it more distinct to users
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
            //Created condition outside of text widget so that the name isn't displayed when nothing has been input yet
            if (_counter >= 1)
              //Displays text widget with the first and last name concatenated with string interpolation
              Text(
                'Hello $firstName $lastName',
                style: Theme.of(context).textTheme.headline4,
              ),
          ],
        ),
      ),
      //Floating action button used to update the name display as well as the counter only after being pressed
      floatingActionButton: FloatingActionButton(
        onPressed: changeNameCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
