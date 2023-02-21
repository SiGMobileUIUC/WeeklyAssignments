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
                    child: Text('Go to navigation rail'),
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
//Navigation Rail widget that we call to navigate to a new screen with just the rail
class NavRail extends StatefulWidget {
  const NavRail({Key? key}) : super(key: key);

  @override
  State<NavRail> createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  int _selectedIndex = 0;
  //Creating private variable for index of what screen to be on
  int _selectedIndex = 0;
  //Labeltype for the navigation rail to use later on when creating the builder
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
          //First child is a NavigationRail widget that houses similar feature to a bottom navigation bar
          NavigationRail(
            //LableType defines the layout and behavior of the labels for the default,
            labelType: labelType,
            //selectedIndex sets the current index of the rail to the private variable stored above
            selectedIndex: _selectedIndex,
            //This is the function called when any of the destinations on the rail are pressed by the user
            onDestinationSelected: (int index) {
              setState(() {
                //setState function to update the private variable with the new index selected as well as update the screen
                _selectedIndex = index;
              });
            },
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
              //Created multiple NavigationRailDestinations which are each a part of a list
              NavigationRailDestination(
                //Each destination requires an icon and label. 
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
          //Wrapped an indexStack with an Expanded widget so that the containers extend to the edges of the screen
          Expanded(
            //An indexedStack is a widget to store a list of wdigets to display based on the selected index
            //This is usually paired with a bottom navigation bar or a navigation rail to efffectively display 
            //different "screens" when clicking on different destinations/icons
            child: IndexedStack(
              //Current index is set the private variable we initialized and are updating above
              index: _selectedIndex,
              //Children is the list of widgets that we display based on their index
              //Each index is already set based on the order that they are in in the list
              //So it starts from 0 -> 1 -> 2 -> ...
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

//Bottom Navigation Bar widget
class BotNavBar extends StatefulWidget {
  const BotNavBar({Key? key}) : super(key: key);

  @override
  State<BotNavBar> createState() => BotNavBarState();
}

class BotNavBarState extends State<BotNavBar> {
  //Index to keep track of the index of what screen is within the bottom navigation bar
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
      //Setting the body to be an indexedStaack like I did in the navigation rail as we can use a Scaffolding here
      body: IndexedStack(
        //Setting the index of the indexed stack to that of the privately stored integer that keeps track of
        //The index of what button is being pressed in the bottom navigation bar
        index: _curNavIdx,
        children: [
          //Created 3 containers named 'home', 'profile', and 'settings' corresponding to the labels on the 
          //bottom navigation bar
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
      //You can place a bottom navigation bar after the body just like a floating action button
      bottomNavigationBar: BottomNavigationBar(
        //Sets the current Index of the bottom navigation bar to the privately stored index above
        currentIndex: _curNavIdx,
        items: const [
          //Inside the items, which is a list of BottomNavigationBarItems, it's similar to the 
          //Destinations for the navigation rail
          BottomNavigationBarItem(
            //Inside each item you will need a label and an icon
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
          //On tap function called when any of the buttons are pressed
          //Passes the index value stored into the setState function to update the privately
          //Stored integer above to update the screen with the IndexedStack
              _curNavIdx = value;
            })),
      ),
    );
  }
}
