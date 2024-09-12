import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memo_neet/pages/Home.dart';
import 'package:memo_neet/pages/Plans.dart';
import 'package:memo_neet/pages/Settings.dart';
import 'package:memo_neet/pages/TestSeries.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Memo NEET',
      home: const MyHomePage(title: 'Memo NEET'),
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
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  
  final List<Widget> _pages = [Home(), TestSeries(), Plans(), Settings()];

  

 @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                signOut();
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),*/
        body: _pages[_currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0),
            topRight: Radius.circular(5.0),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromARGB(255, 26, 123, 51),
            selectedItemColor:
                Color.fromARGB(255, 163, 230, 165), // Set selected icon color
            unselectedItemColor: Color.fromARGB(181, 6, 69, 7),
            iconSize: 40,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pending_actions),
                label: 'Test Series',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Plans',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.view_cozy),
                label: 'Settings',
              ),
            ],
          ),
        )
        //Center(child: Text(user?.email ?? 'user email')),
        );
  }
}
