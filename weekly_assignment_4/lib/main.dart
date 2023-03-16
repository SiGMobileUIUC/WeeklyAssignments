import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SIGMobile Weekly Assignment 4',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Home Page'),
        routes: <String, WidgetBuilder>{
          '/botNavBar': (BuildContext context) => const BotNavBar(),
          '/navRail': (BuildContext context) => const NavRail(),
        });
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/botNavBar');
              },
              child: const Text('Go to bottom navigation bar'),
            ),
            const SizedBox(width: 45),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/navRail');
              },
              child: const Text('Go to navigation rail'),
            )
          ],
        )));
  }
}

class BotNavBar extends StatefulWidget {
  const BotNavBar({super.key});

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 172, 112, 207));

  void _selectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar'),
        backgroundColor: const Color.fromARGB(255, 172, 112, 207),
      ),
      body: Center(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Home',
                style: optionStyle,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Profile',
                style: optionStyle,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Settings',
                style: optionStyle,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 215, 161, 247),
        onTap: _selectIndex,
      ),
    );
  }
}

class NavRail extends StatefulWidget {
  const NavRail({super.key});

  @override
  State<NavRail> createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  void _selectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar'),
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _selectIndex,
            labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('Favorite'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Bookmark'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Star'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Favorite',
                    style: optionStyle,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Bookmark',
                    style: optionStyle,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Star',
                    style: optionStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
