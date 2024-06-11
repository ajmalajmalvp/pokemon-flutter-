import 'package:flutter/material.dart';
import 'package:pokemon/component/widget/home/list_tile.dart';
import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/screens/details/pokemon_details.dart';
import 'package:pokemon/utils/colors.dart';

class HomeListWidget extends StatelessWidget {
  const HomeListWidget({super.key, required this.pokemonList});
  final List<Pokemon> pokemonList;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(24),
      children: <Widget>[
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: pokemonList.length,
          separatorBuilder: (_, __) => const SizedBox(height: 18),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PokemonDetail(
                        pokemon: pokemonList[index],
                      ),
                    ));
              },
              child: ListTileWidget(
                color: pokemonTypeMap[pokemonList[index].types[0].types],
                title: pokemonList[index].name,
                thumbnail: NetworkImage(pokemonList[index].imageUrl),
              ),
            );
          },
        ),
      ],
    );
  }
}
