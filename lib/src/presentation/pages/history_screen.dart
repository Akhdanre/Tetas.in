import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetas_in/src/bussines_logic/bloc/history_bloc.dart';
import 'package:tetas_in/src/presentation/pages/detail_history.dart';
import 'package:tetas_in/src/utils/color_string.dart';
import 'package:tetas_in/src/utils/size_config.dart';
import 'package:tetas_in/src/presentation/widgets/background.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int tempValue = 10;
  int humdValue = 10;
  @override
  Widget build(BuildContext context) {
    SizeConfig screen = SizeConfig(context);
    return Scaffold(
      body: SafeArea(
        child: Background(
          screen: screen,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: screen.vertical1, horizontal: screen.vertical2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  child: Text(
                    "History",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: baseColorBg,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(2, 5),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "lorem"),
                        ),
                      ),
                      Icon(Icons.search)
                    ],
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
                      ),
                    ],
                    color: baseColorBg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Start Date"),
                            Text("ID Incubator"),
                            Text("Num Egg"),
                          ],
                        ),
                        BlocBuilder<HistoryBloc, HistoryState>(
                          builder: (context, state) {
                            if (state is HistoryData) {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.data.length,
                                itemBuilder: (context, index) => Column(
                                  children: [
                                    const Divider(
                                      color: Colors.black,
                                      height: 20,
                                      thickness: 2,
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailHistory(
                                                  id: state.data[index].id
                                                      .toString(),
                                                  date: state
                                                      .data[index].startData,
                                                  dataTarget: state.data[index]
                                                      .endDataEstimation,
                                                  numEgs: state
                                                      .data[index].numberOfEgg,
                                                )),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(state.data[index].startData),
                                          Text(state.data[index].id.toString()),
                                          Text(state.data[index].numberOfEgg
                                              .toString()),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                            return const Center(
                                child: Text("belum memulai penetasan"));
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
