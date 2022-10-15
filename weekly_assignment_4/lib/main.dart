import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NavHomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/botNavBar': (context) => BotNavBar(),
        '/navRail': (context) => NavRail(),
      },
    );
  }
}

//Home page that has 2 buttons, 1 that leads to the Screen with a bottom navigation bar and the other that has a navigation rail

class NavHomePage extends StatefulWidget {
  const NavHomePage({Key? key}) : super(key: key);

  @override
  State<NavHomePage> createState() => NavHomePageState();
}

class NavHomePageState extends State<NavHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Weekly Assignment'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(10.0),
                      ),
                    ),
                    child: Text('Go to bottom navigation bar'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/botNavBar');
                    },
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(10.0),
                      ),
                    ),
                    child: Text('Go to navigation rail'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/navRail');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Navigation Rail

class NavRail extends StatefulWidget {
  const NavRail({Key? key}) : super(key: key);

  @override
  State<NavRail> createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Rail'),
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            labelType: labelType,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
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
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Text('Favorite'),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text('Bookmark'),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text('Star'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Bottom Navigation Bar

class BotNavBar extends StatefulWidget {
  const BotNavBar({Key? key}) : super(key: key);

  @override
  State<BotNavBar> createState() => BotNavBarState();
}

class BotNavBarState extends State<BotNavBar> {
  int _curNavIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar'),
      ),
      body: IndexedStack(
        index: _curNavIdx,
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
        currentIndex: _curNavIdx,
        items: const [
          BottomNavigationBarItem(
            label: 'home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'profile',
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: 'settings',
            icon: Icon(Icons.settings),
          ),
        ],
        onTap: ((value) => setState(() {
              _curNavIdx = value;
            })),
      ),
    );
  }
}
