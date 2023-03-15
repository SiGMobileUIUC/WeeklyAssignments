import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/botNavBar': (context) => const BotNavBar(),
        '/NavRail': (context) => const NavRail(),
      },
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/botNavBar');
              },
              child: const Text("Go to bottom navigation bar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/NavRail');
              },
              child: const Text("Go to navigation rail"),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NavRail extends StatefulWidget {
  const NavRail({super.key});

  @override
  State<NavRail> createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  int _selectedIdx = 0;
  final NavigationRailLabelType _labelType = NavigationRailLabelType.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Rail'),
      ),
      body: Row(
        //We are using a row to store the Navigation rail on the left side and the containers
        //on the right side
        children: <Widget>[
          //1st child is the Navigation Rail w/ all Desitations stored in it
          NavigationRail(
            //Defines the layout and behavior of the navigation rail and we
            //Override the default layout with the variable we stored above
            labelType: _labelType,
            //Parameter of navigator widgets that sets the currentIndex stored in
            //the navigation rail to an externally stored integer
            selectedIndex: _selectedIdx,
            //Function w/ int paramter to be called when a different rail destination is selected
            onDestinationSelected: (index) {
              setState(() {
                _selectedIdx = index;
              });
            },
            //A list of "destinations" w/ different icons & labels & indeces starting at 0
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('Favorite'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.bookmark),
                label: Text('Bookmark'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Star'),
              ),
            ],
          ),
          //We us an expanded widget to allow the containers to the right of the
          //rail to expand and cover the rest of the available screen instead of being
          //Smushed against the rail
          Expanded(
            //The indexed stack organizes a list of widgets in order by index
            //And can switch between them through a passed in idx that we store and update externally
            child: IndexedStack(
              index: _selectedIdx,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Text('favorite'),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text('bookmark'),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text('star'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BotNavBar extends StatefulWidget {
  const BotNavBar({super.key});

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int curIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar'),
      ),
      body: IndexedStack(
        index: curIdx,
        children: [
          Container(
            alignment: Alignment.center,
            child: const Text('home'),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text('profile'),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text('settings'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curIdx,
        //On tap function here is the same as the onDestinationSelected parameter
        //That was used for the navigation rail
        onTap: ((value) => setState(() {
              curIdx = value;
            })),
        //The items here are like the desinations and they store BottomNavigationBarItmes
        //Each item has an icon and lable like the rail
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
    );
  }
}
