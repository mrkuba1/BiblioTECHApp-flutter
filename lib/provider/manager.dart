import 'package:bibliotechaapp/models/book.dart';
import 'package:flutter/material.dart';

class Manager extends ChangeNotifier {
  final List<Book> _favoriteBooks = [];
  final List<Book> _reservedBooks = [];

  List<Book> get favoriteBooks => List.unmodifiable(_favoriteBooks);
  List<Book> get reservedBooks => List.unmodifiable(_reservedBooks);

  void toggleFavorite(Book book) {
    if (_favoriteBooks.contains(book)) {
      _favoriteBooks.remove(book);
    } else {
      _favoriteBooks.add(book);
    }
    notifyListeners();
  }

  void removeFavoriteBook(Book book) {
    if (_favoriteBooks.contains(book)) {
      _favoriteBooks.remove(book);
      notifyListeners();
    }
  }

  bool isFavorite(Book book) => _favoriteBooks.contains(book);

  void addReservedBooks(List<Book> cartBooks) {
    _reservedBooks.addAll(cartBooks);
    notifyListeners();
  }
}
