import 'package:flutter/material.dart';
import 'package:tetas_in/src/view/pages/controller_screen.dart';
import 'package:tetas_in/src/view/pages/evolution_screen.dart';
import 'package:tetas_in/src/view/pages/home_screen.dart';

class BaseScreen extends StatefulWidget {
  BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const EvolutionScreen(),
    const ControllerScreen(),
    Center(child: Text("History")),
  ];

  int selectedIndex = 0;

  void changeIndex(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(selectedIndex),
      // IndexedStack(
      //   index: selectedIndex,
      //   children: _pages,
      // ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          currentIndex: selectedIndex,
          onTap: changeIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Evolution',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Controller',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_edu_outlined),
              label: 'History',
            ),
          ]),
    );
  }
}
