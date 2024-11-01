import 'package:bibliotechaapp/pages/library.dart';
import 'package:bibliotechaapp/pages/profile.dart';
import 'package:bibliotechaapp/provider/manager.dart';
import 'package:bibliotechaapp/models/book.dart';
import 'package:bibliotechaapp/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final List<Book> allBooks = [
    Book(
      id: 1,
      title: 'Harry Potter i Kamień Filozoficzny',
      author: 'J.K. Rowling',
      publicationYear: 1997,
      genre: 'Fantasy',
      isAvailable: true,
      image:
          'https://ecsmedia.pl/cdn-cgi/image/format=webp,/c/harry-potter-i-kamien-filozoficzny-b-iext147531850.jpg',
      category: 'Fantasy',
    ),
    Book(
      id: 2,
      title: 'Zabić drozda',
      author: 'Harper Lee',
      publicationYear: 1960,
      genre: 'Fikcja',
      isAvailable: true,
      image: 'https://example.com/images/to_kill_a_mockingbird.jpg',
      category: 'Fiction',
    ),
    Book(
      id: 3,
      title: '1984',
      author: 'George Orwell',
      publicationYear: 1949,
      genre: 'Science Fiction',
      isAvailable: false,
      image: 'https://example.com/images/1984.jpg',
      category: 'Science Fiction',
    ),
    Book(
      id: 4,
      title: 'Wielki Gatsby',
      author: 'F. Scott Fitzgerald',
      publicationYear: 1925,
      genre: 'Fikcja',
      isAvailable: true,
      image: 'https://example.com/images/the_great_gatsby.jpg',
      category: 'Fiction',
    ),
    Book(
      id: 5,
      title: 'Hobbit',
      author: 'J.R.R. Tolkien',
      publicationYear: 1937,
      genre: 'Fantasy',
      isAvailable: true,
      image: 'https://example.com/images/the_hobbit.jpg',
      category: 'Fantasy',
    ),
    Book(
      id: 6,
      title: 'Duma i uprzedzenie',
      author: 'Jane Austen',
      publicationYear: 1813,
      genre: 'Romans',
      isAvailable: true,
      image: 'https://example.com/images/pride_and_prejudice.jpg',
      category: 'Romance',
    ),
    Book(
      id: 7,
      title: 'Buszujący w zbożu',
      author: 'J.D. Salinger',
      publicationYear: 1951,
      genre: 'Fikcja',
      isAvailable: true,
      image: 'https://example.com/images/the_catcher_in_the_rye.jpg',
      category: 'Fiction',
    ),
    Book(
      id: 8,
      title: 'Władca Pierścieni',
      author: 'J.R.R. Tolkien',
      publicationYear: 1954,
      genre: 'Fantasy',
      isAvailable: true,
      image: 'https://example.com/images/the_lord_of_the_rings.jpg',
      category: 'Fantasy',
    ),
    Book(
      id: 9,
      title: 'Moby Dick',
      author: 'Herman Melville',
      publicationYear: 1851,
      genre: 'Przygoda',
      isAvailable: true,
      image: 'https://example.com/images/moby_dick.jpg',
      category: 'Adventure',
    ),
    Book(
      id: 10,
      title: 'Portret Doriana Graya',
      author: 'Oscar Wilde',
      publicationYear: 1890,
      genre: 'Fikcja gotycka',
      isAvailable: true,
      image: 'https://example.com/images/the_picture_of_dorian_gray.jpg',
      category: 'Gothic Fiction',
    ),
    Book(
      id: 11,
      title: 'Opowieści z Narnii',
      author: 'C.S. Lewis',
      publicationYear: 1950,
      genre: 'Fantasy',
      isAvailable: true,
      image: 'https://example.com/images/the_chronicles_of_narnia.jpg',
      category: 'Fantasy',
    ),
    Book(
      id: 12,
      title: 'Dziwne losy Jane Eyre',
      author: 'Charlotte Bronte',
      publicationYear: 1847,
      genre: 'Fikcja gotycka',
      isAvailable: true,
      image: 'https://example.com/images/jane_eyre.jpg',
      category: 'Gothic Fiction',
    ),
    Book(
      id: 13,
      title: 'Nowy wspaniały świat',
      author: 'Aldous Huxley',
      publicationYear: 1932,
      genre: 'Science Fiction',
      isAvailable: true,
      image: 'https://example.com/images/brave_new_world.jpg',
      category: 'Science Fiction',
    ),
    Book(
      id: 14,
      title: 'Odyseja',
      author: 'Homer',
      publicationYear: -800,
      genre: 'Epopeja',
      isAvailable: true,
      image: 'https://example.com/images/the_odyssey.jpg',
      category: 'Epic Poetry',
    ),
    Book(
      id: 15,
      title: 'Wichrowe Wzgórza',
      author: 'Emily Bronte',
      publicationYear: 1847,
      genre: 'Fikcja gotycka',
      isAvailable: true,
      image: 'https://example.com/images/wuthering_heights.jpg',
      category: 'Gothic Fiction',
    ),
    Book(
      id: 16,
      title:
          'Solved Problems in Numerical Methods for Students of Electronics and Information Technology',
      author: 'Andrzej Miękina, Roman Z. Morawski',
      publicationYear: 2021,
      genre: 'Nauka',
      isAvailable: true,
      image: 'https://example.com/images/wuthering_heights.jpg',
      category: 'Science',
    ),
  ];

  late List<Book> displayedBooks;
  late List<Book> cartBooks;
  late String selectedCategory;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    displayedBooks = List.from(allBooks);
    cartBooks = [];
    selectedCategory = 'Wszystkie kategorie';
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterBooks(String query) {
    setState(() {
      displayedBooks = allBooks.where((book) {
        final titleLower = book.title.toLowerCase();
        final authorLower = book.author.toLowerCase();
        final queryLower = query.toLowerCase();
        return titleLower.contains(queryLower) ||
            authorLower.contains(queryLower);
      }).toList();
    });
  }

  void filterBooksByCategory(String? category) {
    setState(() {
      if (category == 'Wszystkie kategorie') {
        displayedBooks = List.from(allBooks);
      } else {
        displayedBooks =
            allBooks.where((book) => book.category == category).toList();
      }
      selectedCategory = category!;
    });
  }

  void addToCart(Book book) {
    setState(() {
      if (!cartBooks.contains(book)) {
        cartBooks.add(book);
      }
    });
  }

  void navigateToCartPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(cartBooks: cartBooks),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(44, 51, 115, 1),
        title: const Text(
          'BiblioTECHa',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFFFFF)),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UserProfilePage()));
          },
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1609010697446-11f2155278f0?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const LibraryInfoPage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                'https://i.imgur.com/mzVbZvI.png',
                width: 40,
                height: 40,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Wyszukaj...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    filterBooks('');
                  },
                ),
              ),
              onChanged: filterBooks,
            ),
          ),
          DropdownButton<String>(
            value: selectedCategory,
            items: [
              'Wszystkie kategorie',
              'Fiction',
              'Fantasy',
              'Romans',
              'Przygoda',
              'Gothic Fiction',
              'Science Fiction',
              'Epopeja',
              'Nauka',
            ].map((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: filterBooksByCategory,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedBooks.length,
              itemBuilder: (BuildContext context, int index) {
                final book = displayedBooks[index];
                return ListTile(
                  title: Text(book.title),
                  subtitle: Text(book.author),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add_shopping_cart),
                        onPressed: () => addToCart(book),
                      ),
                      Consumer<Manager>(
                        builder: (context, manager, _) => IconButton(
                          icon: Icon(
                            manager.isFavorite(book)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: manager.isFavorite(book) ? Colors.red : null,
                          ),
                          onPressed: () {
                            manager.toggleFavorite(book);
                            setState(() {
                              //         print(manager.favoriteBooks);
                              book.isFavorite = !book.isFavorite;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: navigateToCartPage,
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 32.0,
                    ),
                    backgroundColor: const Color(0xff3A3E61)),
                child: const Text(
                  'Zamów',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
