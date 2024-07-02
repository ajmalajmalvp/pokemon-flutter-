import 'package:book_reader_app/screens/home/widget/book_filter.dart';
import 'package:book_reader_app/screens/home/widget/book_search.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Library'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: BookSearch());
            },
          ),
        ],
      ),
      body: BookList('Fiction'), // Default genre
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Fiction'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookList('Fiction')));
              },
            ),
            ListTile(
              title: Text('Science'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookList('Science')));
              },
            ),
            // Add more categories here
          ],
        ),
      ),
    );
  }
}
