import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/model/pokemon_result.dart';

class HomeProvider extends ChangeNotifier {
  List<Pokemon> pokemonModel = [];

  String url = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=20";
  bool isLoading = false;

  void updateLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void getPokemonData(String url) async {
    var response = await http.get(Uri.parse(url));
    var decodedJson = jsonDecode(response.body);
    var pokemon = Pokemon.fromMap(decodedJson);
    pokemonModel.add(pokemon);
    pokemonModel.sort((a, b) => a.id.compareTo(b.id));
    updateLoading(false);
  }

  void loadPokemon() async {
    try {
      updateLoading(true);
      var response = await http.get(Uri.parse(url));
      var decodedJson = jsonDecode(response.body);
      var results = decodedJson["results"];
      url = decodedJson["next"];
      var pokemon = List.from(results)
          .map((pokemonResult) => PokemonResult.fromMap(pokemonResult))
          .toList();
      for (var result in pokemon) {
        getPokemonData(result.url);
      }
    } catch (e) {
      dev.log(e.toString());
      updateLoading(false);
    }
  }
}
