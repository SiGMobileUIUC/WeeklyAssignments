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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  String _firstName = "";
  String _lastName= "";
  String _showMe = "";
  late TextEditingController _controller;
  late TextEditingController _controller1;

 

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller1 = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();
    super.dispose();
  }

  void _addWords() {
    setState(() {
      _showMe = _firstName + " " + _lastName;
   });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: 
        Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Name',
                    ),
                    onSubmitted: (String str){
                      setState((){
                        _firstName = str;
                      });
                    }
                  ),
                  TextField(
                    controller: _controller1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last Name',
                    ),
                    onSubmitted: (String str){
                      setState((){
                        _lastName = str;
                      });
                    }
                  ),
                  Text(
                    _showMe,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  FloatingActionButton(
                    tooltip: 'Add',
                    child: const Icon(Icons.add),
                    onPressed: () =>_addWords(),
                  ), // This trailing comma makes auto-formatting nicer for build methods.
          ]
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
