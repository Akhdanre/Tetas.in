import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetas_in/src/bussines_logic/bloc/controller_bloc.dart';
import 'package:tetas_in/src/bussines_logic/bloc/evolution_bloc.dart';
import 'package:tetas_in/src/bussines_logic/bloc/history_bloc.dart';
import 'package:tetas_in/src/bussines_logic/bloc/home_bloc.dart';
import 'package:tetas_in/src/presentation/pages/controller_screen.dart';
import 'package:tetas_in/src/presentation/pages/evolution_screen.dart';
import 'package:tetas_in/src/presentation/pages/history_screen.dart';
import 'package:tetas_in/src/presentation/pages/home_screen.dart';
import 'package:tetas_in/src/utils/color_string.dart';

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
    BlocProvider(
      create: (context) => EvolutionBloc(),
      child: const EvolutionScreen(),
    ),
    BlocProvider(
      create: (context) => ControllerBloc(),
      child: const ControllerScreen(),
    ),
    BlocProvider(
      create: (context) => HistoryBloc(),
      child: const HistoryScreen(),
    )
  ];

  void changePage(index) {
    pageController.jumpToPage(index);
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text("yes")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text("no")),
              ],
            ),
          );
        },
        child: Scaffold(
          body: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: _pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: orangeString,
              unselectedItemColor: orangeString2,
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
        ));
  }
}
