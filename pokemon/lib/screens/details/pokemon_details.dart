import 'package:flutter/material.dart';
import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/screens/details/widgets/status_list.dart';
import 'package:pokemon/screens/details/widgets/type_details.dart';
import 'package:pokemon/utils/colors.dart';

class PokemonDetail extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonDetail({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: getBackGroundColor(pokemon.types[0].types),
        elevation: 0,
        title: const Text(
          "PokeDex",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Card(
              margin: EdgeInsets.zero,
              color: getBackGroundColor(pokemon.types[0].types),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child:
                  Hero(tag: pokemon.id, child: Image.network(pokemon.imageUrl)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            pokemon.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            // width: double.infinity,
            child: PokemonTypeList(types: pokemon.types),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WeightHeightContainer(
                  title: "Weight", value: "${pokemon.weight / 10} KG"),
              WeightHeightContainer(
                  title: "Height", value: "${pokemon.height / 10} M")
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Base Stats",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: BaseStatsList(stats: pokemon.stats),
          ),
        ],
      ),
    ));
  }
}

class WeightHeightContainer extends StatelessWidget {
  final String title;
  final String value;
  const WeightHeightContainer(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
