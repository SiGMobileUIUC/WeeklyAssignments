import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/navpage' :  (context) => NavPage(),
        '/railpage' : (context) => RailPage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
      
      body: Center ( 
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [ 
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/navpage');
            },
          child: const Text('Go to bottom navigation bar')
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/railpage');
            },
          child: const Text('Go to navigation rail')
          )
        ],),
      )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPage();
}

class _NavPage extends State<NavPage> {
  int currentPageIndex = 2;
  final screens = [MyMainPage(), MyProfilePage(), SettingsPage()];
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nav'),
      ),
      body: IndexedStack( 
        index: currentPageIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar( 
        onTap: (index) {
            setState(() {
              currentPageIndex = index;
            });
        },
        currentIndex: currentPageIndex,
        items: const <BottomNavigationBarItem>[ 
           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile',),
           BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings',),
        ],
        
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class RailPage extends StatefulWidget {
  const RailPage({super.key});
  
  @override
  State<RailPage> createState() => _RailPage();
}

class _RailPage extends State<RailPage> {
  int currentPageIndex = 2;
  final screens = [FavPage(), BookMarkPage(), StarPage()];

  @override

 
  Widget build(BuildContext context) {
  
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Rail'),
      ),
      body: Row( 
        
        children: [ 
          
          NavigationRail( 
        selectedIndex: currentPageIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <NavigationRailDestination>[ 
          NavigationRailDestination(
            icon: Icon(Icons.favorite), 
            selectedIcon: Icon(Icons.favorite), 
            label: Text('Favorite')
          ),
          NavigationRailDestination(
            icon: Icon(Icons.bookmark_border), 
            selectedIcon: Icon(Icons.bookmark_border), 
            label: Text('Bookmark')
          ),
          NavigationRailDestination(
            icon: Icon(Icons.star_border), 
            selectedIcon: Icon(Icons.star_border), 
            label: Text('Star')
          ),
        ],
      ),
      Expanded( 
        child: IndexedStack ( 
          index: currentPageIndex,
          children: screens,
        )
      )
    ],
  )
      
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}


class MyMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: const Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home',
            ),
            
          ],
        ),
      ),
      
      ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: const Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Profile',
            ),
            
          ],
        ),
      ),
      
      ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: const Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Settings',
            ),
            
          ],
        ),
      ),
      
      ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class FavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: const Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Favorite',
            ),
            
          ],
        ),
      ),
      
      ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class BookMarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: const Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bookmark',
            ),
            
          ],
        ),
      ),
      
      ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class StarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: const Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Star',
            ),
            
          ],
        ),
      ),
      
      ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}