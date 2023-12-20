import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetas_in/src/bussines_logic/bloc/evolution_bloc.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EvolutionScreen extends StatefulWidget {
  const EvolutionScreen({super.key});

  @override
  State<EvolutionScreen> createState() => _EvolutionScreenState();
}

class _EvolutionScreenState extends State<EvolutionScreen> {
  final ScrollController scrollController = ScrollController();
  String dueDate = "12-12-2023";
  late int dayProgress;
  late String description1;

  @override
  Widget build(BuildContext context) {
    SizeConfig screen = SizeConfig(context);
    return Scaffold(
      body: SafeArea(
        child: Background(
          screen: screen,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    "Egg Evolution",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: screen.widht,
                  child: BlocBuilder<EvolutionBloc, EvolutionState>(
                    buildWhen: (previous, current) =>
                        previous != current && current is EvolutioanProgress,
                    builder: (context, state) {
                      if (state is EvolutioanProgress) {
                        if (scrollController.hasClients) {
                          scrollController.jumpTo(state.day.toDouble());
                        }
                        dayProgress = state.day - 1;
                        return ListView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .read<EvolutionBloc>()
                                    .evolutionProgress(index + 1);
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: index == (state.day - 1)
                                      ? yellowString
                                      : Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: const Offset(2, 5),
                                    )
                                  ],
                                  shape: BoxShape.circle,
                                ),
                                child: Center(child: Text("${index + 1}")),
                              ),
                            ),
                          ),
                        );
                      }
                      if (state is EvolutionProgressSwitch) {
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: index == state.day
                                    ? yellowString
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: const Offset(2, 5),
                                  )
                                ],
                                shape: BoxShape.circle,
                              ),
                              child: Center(child: Text("${index + 1}")),
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(2, 5),
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: Center(child: Text("${index + 1}")),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 379,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(1.5, 5),
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: BlocBuilder<EvolutionBloc, EvolutionState>(
                      builder: (context, state) {
                        if (state is EvolutioanProgress && state.day != 0) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                  child: Image.asset(
                                      "Assets/Telur/${state.day}.jpg")),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Day ${state.day}",
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Due date : $dueDate",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }

                        if (state is EvolutionProgressSwitch) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                  child: Image.asset(
                                      "Assets/Telur/${state.day}.jpg")),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Day ${state.day}",
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    "Due date : $dueDate",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                            ],
                          );
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(child: Image.asset("Assets/Telur/${1}.jpg")),
                            const Text("Day 1",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold)),
                            Text(
                              "Due date : $dueDate",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w300),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(1.5, 5),
                        )
                      ],
                      color: baseColorBg,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Information",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<EvolutionBloc, EvolutionState>(
                          builder: (context, state) {
                            if (state is EvolutioanProgress && state.day != 0) {
                              if (state.day <= 2) {
                                description1 = AppLocalizations.of(context)
                                    .day_progress_1_2;
                              } else if (state.day <= 3) {
                                description1 =
                                    AppLocalizations.of(context).day_progress_3;
                              } else if (state.day <= 5) {
                                description1 = AppLocalizations.of(context)
                                    .day_progress_4_5;
                              } else if (state.day <= 9) {
                                description1 = AppLocalizations.of(context)
                                    .day_progress_6_9;
                              } else if (state.day <= 15) {
                                description1 = AppLocalizations.of(context)
                                    .day_progress_10_14;
                              } else if (state.day <= 20) {
                                description1 = AppLocalizations.of(context)
                                    .day_progress_16_20;
                              }
                            }
                            if (state is EvolutionProgressSwitch &&
                                state.day != 0) {
                              if (state.day <= 2) {
                                description1 = AppLocalizations.of(context)
                                    .day_progress_1_2;
                              } else if (state.day <= 3) {
                                description1 =
                                    AppLocalizations.of(context).day_progress_3;
                              } else if (state.day <= 5) {
                                description1 = AppLocalizations.of(context)
                                    .day_progress_4_5;
                              } else if (state.day <= 9) {
                                description1 = AppLocalizations.of(context)
                                    .day_progress_6_9;
                              } else if (state.day <= 15) {
                                description1 = AppLocalizations.of(context)
                                    .day_progress_10_14;
                              } else if (state.day <= 20) {
                                description1 = AppLocalizations.of(context)
                                    .day_progress_16_20;
                              }
                              return Text(
                                description1,
                                textAlign: TextAlign.justify,
                              );
                            }
                            return Text(
                              AppLocalizations.of(context).day_progress_1_2,
                              textAlign: TextAlign.justify,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
