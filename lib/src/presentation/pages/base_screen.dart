import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetas_in/src/bussines_logic/bloc/controller_bloc.dart';
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
  PageController pageController = PageController();

  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomeScreen(),
    ),
    const EvolutionScreen(),
    BlocProvider(
      create: (context) => ControllerBloc(),
      child: const ControllerScreen(),
    ),
    const HistoryScreen()
  ];

  void changePage(index) {
    pageController.jumpToPage(index);
    selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          currentIndex: selectedIndex,
          onTap: changePage,
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
