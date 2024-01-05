import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetas_in/src/bussines_logic/bloc/base_screen_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BaseScreenBloc()..onInitBloc(),
      child: PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) async {
            if (didPop) return;
            return await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("are you sure want to leave app"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                        // Navigator.pop(context);
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
          child: BlocBuilder<BaseScreenBloc, BaseScreenState>(
            buildWhen: (previous, current) =>
                previous != current && current is SuccessChangePage,
            builder: (context, state) {
              if (state is SuccessChangePage) {
                pageController.jumpToPage(state.page);
              }
              return Scaffold(
                body: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: _pages,
                ),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.orange,
                  unselectedItemColor: Colors.orangeAccent,
                  currentIndex: state is SuccessChangePage ? state.page : 0,
                  onTap: (int page) => context
                      .read<BaseScreenBloc>()
                      .add(ChangePage(page: page)),
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
                  ],
                ),
              );
            },
          )),
    );
  }
}
