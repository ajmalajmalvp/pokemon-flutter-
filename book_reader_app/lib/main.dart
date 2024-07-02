import 'package:book_reader_app/screens/home/home_screen.dart';
import 'package:book_reader_app/screens/home/provider/home_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBxpg_38RfdiT0F7Wl_jrA22iqhJ5r6UFM",
      appId: "1:1004623670844:web:19fe7178b40ff77842dd39",
      messagingSenderId: "1004623670844",
      projectId: "pickup-115e9",
    ),
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Library',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
