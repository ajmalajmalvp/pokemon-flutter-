import 'package:flutter/material.dart';
import 'package:pokemon/model/pokemon.dart';

class BaseStatsList extends StatelessWidget {
  final List<Stats> stats;
  const BaseStatsList({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: stats.length,
        itemBuilder: (context, index) {
          return BaseStatsContainer(stats: stats[index]);
        });
  }
}

class BaseStatsContainer extends StatelessWidget {
  final Stats stats;
  const BaseStatsContainer({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          stats.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
            width: 270,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            alignment: Alignment.topLeft,
            child: Stack(
              children: [
                Container(
                  width: stats.stat * 1,
                  // "".text.makeCentered(),
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Text(" "),
                ),
                Center(
                  child: Text(
                    "${stats.stat}/270",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // "${stats.stat}/270".text.makeCentered()
              ],
            )),
      ],
    );
  }
}
