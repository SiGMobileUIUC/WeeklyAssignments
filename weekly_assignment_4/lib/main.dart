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
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Exercise 4 HomePage'),
      routes: {
        '/botNavBar': (context) => const BottomNavBarPage(),
        '/navRail': (context) => const NavRailPage()
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
      body: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/botNavBar');
            },
            child: const Text("Go to bottom navigation bar")),
        TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/navRail');
            },
            child: const Text("Go to navigation rail")),
      ]),
    ));
  }
}

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Bottom Nav Bar")),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            Container(
                alignment: Alignment.center,
                child: const Text(
                  "Home",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                )),
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Profile",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: const Text(
                  "Settings",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                )),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
          onTap: (value) => setState(() {
            _selectedIndex = value;
          }),
        ));
  }
}

class NavRailPage extends StatefulWidget {
  const NavRailPage({super.key});

  @override
  State<NavRailPage> createState() => _NavRailPageState();
}

class _NavRailPageState extends State<NavRailPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Navigation Rail Page"),
        ),
        body: Row(
          children: [
            NavigationRail(
                groupAlignment: 0.0,
                labelType: NavigationRailLabelType.all,
                onDestinationSelected: (value) => setState(() {
                      _selectedIndex = value;
                    }),
                destinations: const [
                  NavigationRailDestination(
                      icon: Icon(Icons.favorite), label: Text("Favorite")),
                  NavigationRailDestination(
                      icon: Icon(Icons.bookmark_border),
                      label: Text("Bookmark")),
                  NavigationRailDestination(
                      icon: Icon(Icons.star_border), label: Text("Star")),
                ],
                selectedIndex: _selectedIndex),
            const VerticalDivider(
              thickness: 1,
              width: 1,
            ),
            Expanded(
                child: IndexedStack(
              index: _selectedIndex,
              children: [
                Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Favorite",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    )),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Bookmark",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Star",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    )),
              ],
            ))
          ],
        ));
  }
}
