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
        //Creating routes to use Navigator.pushNamed later with ease
        '/botNavBar': (context) => const BotNavBar(),
        //The first part is the name of the route that you will call, 
        //the 2nd part is the context that you will pass to the new route
        //Last part is obviously the destination of the route
        '/navRail': (context) => const NavRail(),
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
    //We're using a scaffold here to allow us to have an appbar to display the title as well as a body to house the 2 buttons needed
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Weekly Assignment'),
      ),
      body: Align(
        //We aligned the buttons in the center of the screen for better visibilty
        alignment: Alignment.center,
        //We used a column to be able to center the buttons vertically
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // We wrapped the Row with a SafeArea so that the buttons aren't on the edges of the screen
            SafeArea(
              child: Row(
                //Used a row to organize the buttons horizontally for visual clarity
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Used textButtons to navigate between the main screen and the bottom navigation bar in this case
                  TextButton(
                    style: ButtonStyle(
                      //Used buttonStyle to add a background color and padding between each button
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      //when using ButtonStyle you will want to use MaterialStateProperty rather than just Colors.red
                      //For most parameters as this was a change made that we have to adapt to
                      padding: MaterialStateProperty.all(
                        //10 Pixels of padding around this button
                        const EdgeInsets.all(10.0),
                      ),
                    ),
                    child: const Text('Go to bottom navigation bar'),
                    onPressed: () {
                      //Calling Navigator.pushNamed to navigate to a set route we created earlier for the navigation rail
                      Navigator.pushNamed(context, '/botNavBar');
                    },
                  ),
                  //Used textButtons to navigate between the main screen and the navigation rail in this case
                  TextButton(
                    //Similar style and function called when button is pressed
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(10.0),
                      ),
                    ),
                    child: const Text('Go to navigation rail'),
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
            child: const Text('Home'),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text('Profile'),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text('Settings'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curNavIdx,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
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
