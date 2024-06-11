import 'package:flutter/material.dart';
import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/utils/colors.dart';

class PokemonTypeList extends StatelessWidget {
  final List<Types> types;
  const PokemonTypeList({super.key, required this.types});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 20,
          );
        },
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: types.length,
        itemBuilder: (context, index) {
          return PokemonTypeContainer(type: types[index].types);
        });
  }
}

class PokemonTypeContainer extends StatelessWidget {
  final String type;
  const PokemonTypeContainer({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: getBackGroundColor(type),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              type,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )));
  }
}
