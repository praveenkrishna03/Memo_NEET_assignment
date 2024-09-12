import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memo_neet/pages/Home.dart';
import 'package:memo_neet/pages/MemoStreaks.dart';
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
      debugShowCheckedModeBanner: false,
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
  
  final List<Widget> _pages = [Home(), TestSeries(),MemoStreaks(), Plans(), Settings()];

  

 @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        body: _pages[_currentIndex],
        bottomNavigationBar: Container(
          color: Colors.blue, 
          padding: EdgeInsets.all(2.0),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor:
                Colors.blue, 
            unselectedItemColor: Colors.black,
            iconSize: 30,
            selectedLabelStyle: TextStyle(fontFamily: 'TiltNeon', fontSize: 12),
            unselectedLabelStyle: TextStyle(fontFamily: 'TiltNeon', fontSize: 12),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pending_actions_outlined),
                label: 'Test Series',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_fire_department_outlined),
                label: 'MemoStreak',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Plans',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.view_cozy_outlined),
                label: 'Settings',
              ),
            ],
          ),
        ));
  }
}
