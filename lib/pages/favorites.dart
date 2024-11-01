import 'package:bibliotechaapp/provider/manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesManager = Provider.of<Manager>(context);
    final favoriteBooks = favoritesManager.favoriteBooks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoriteBooks.length,
        itemBuilder: (BuildContext context, int index) {
          final book = favoriteBooks[index];
          return ListTile(
            title: Text(book.title),
            subtitle: Text(book.author),
            trailing: IconButton(
              icon: const Icon(Icons.favorite),
              color: Colors.red,
              onPressed: () => favoritesManager.toggleFavorite(book),
            ),
          );
        },
      ),
    );
  }
}
