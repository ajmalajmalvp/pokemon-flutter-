import 'package:book_reader_app/screens/home/model/book_model.dart';
import 'package:flutter/material.dart';

List<Book> books = [
  Book(
    title: 'Book One',
    author: 'Author One',
    genre: 'Fiction',
    pdfUrl: 'assets/pdf/file-sample.pdf',
  ),
  Book(
    title: 'Book Two',
    author: 'Author Two',
    genre: 'Science',
    pdfUrl: 'assets/pdf/sample.pdf',
  ),
  Book(
    title: 'Book three',
    author: 'Author three',
    genre: 'Fiction',
    pdfUrl: 'assets/pdf/file-sample.pdf',
  ),
  Book(
    title: 'Book four',
    author: 'Author four',
    genre: 'Science',
    pdfUrl: 'assets/pdf/sample.pdf',
  ),
];

class BookList extends StatelessWidget {
  final String genre;
  BookList(this.genre);

  @override
  Widget build(BuildContext context) {
    List<Book> filteredBooks =
        books.where((book) => book.genre == genre).toList();
    return ListView.builder(
      itemCount: filteredBooks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredBooks[index].title),
          subtitle: Text(filteredBooks[index].author),
        );
      },
    );
  }
}
