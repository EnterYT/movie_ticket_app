// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'stuff_list_screen.dart';
import 'actors_list_screen.dart';
import 'news_page.dart'; // Import the NewsPage file

void main() {
  runApp(const GameOfThronesApp());
}

class GameOfThronesApp extends StatelessWidget {
  const GameOfThronesApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game of Thrones',
      theme: ThemeData(
        primaryColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          accentColor: Colors.redAccent,
        ),
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      home: const MainPage(),
      routes: {
        '/stuffList': (context) =>
            const StuffListScreen(), // Add route for StuffListScreen
        '/actorsList': (context) =>
            const ActorsListScreen(), // Add route for OtherScreen
        '/news': (context) => const NewsPage(), // Add route for NewsPage
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              'assets/img/logo.webp',
              width: 200,
              height: 200,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Welcome to Game of Thrones App',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
    const StuffListScreen(),
    const ActorsListScreen(),
    const NewsPage(), // Add NewsPage to the widget options
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game of Thrones'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Stuff',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Actors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article), // Add icon for NewsPage
            label: 'News', // Add label for NewsPage
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
