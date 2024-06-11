import 'package:flutter/material.dart';
import 'package:pokemon/screens/home/provider/home_provider.dart';
import 'package:pokemon/screens/home/widget/home_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "PokeDex",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer<HomeProvider>(builder: (context, controller, _) {
        return SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              controller.loadPokemon();
            },
            child: controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.pokemonModel.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Net Work Error Refresh Now",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.loadPokemon();
                              },
                              child: const Text("Refresh"),
                            ),
                          ],
                        ),
                      )
                    : HomeListWidget(
                        pokemonList: controller.pokemonModel,
                      ),
          ),
        );
      }),
    );
  }
}
