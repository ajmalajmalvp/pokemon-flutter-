import 'package:book_reader_app/screens/home/model/book_model.dart';
import 'package:book_reader_app/screens/home/widget/book_filter.dart';
import 'package:book_reader_app/screens/home/widget/pdf_viewer_home.dart';
import 'package:flutter/material.dart';

class BookSearch extends SearchDelegate<Book> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(
          context,
          Book(
              title: "title",
              author: "author",
              genre: "genre",
              pdfUrl: "pdfUrl"),
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Book> results = books
        .where((book) =>
            book.title.toLowerCase().contains(query.toLowerCase()) ||
            book.author.toLowerCase().contains(query.toLowerCase()) ||
            book.genre.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].title),
          subtitle: Text(results[index].author),
          onTap: () {
            // Navigate to PDF viewer
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PDFViewer(results[index].pdfUrl)));
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Book> suggestions = books
        .where((book) =>
            book.title.toLowerCase().contains(query.toLowerCase()) ||
            book.author.toLowerCase().contains(query.toLowerCase()) ||
            book.genre.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index].title),
          subtitle: Text(suggestions[index].author),
        );
      },
    );
  }
}
