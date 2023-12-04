import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetas_in/src/bussines_logic/bloc/home_bloc.dart';
import 'package:tetas_in/src/presentation/pages/controller_screen.dart';
import 'package:tetas_in/src/presentation/pages/evolution_screen.dart';
import 'package:tetas_in/src/presentation/pages/history_screen.dart';
import 'package:tetas_in/src/presentation/pages/home_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int selectedIndex = 0;
  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomeScreen(),
    ),
    const EvolutionScreen(),
    const ControllerScreen(),
    const HistoryScreen()
  ];

  void changeIndex(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(selectedIndex),
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
