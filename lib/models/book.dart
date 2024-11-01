class Book {
  final int id;
  final String title;
  final String author;
  final int publicationYear;
  final String genre;
  final bool isAvailable;
  final String image;
  final String category;
  bool isFavorite;
  bool isAddedToCart;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.publicationYear,
    required this.genre,
    required this.isAvailable,
    required this.image,
    required this.category,
    this.isFavorite = false,
    this.isAddedToCart = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  @override
  String toString() {
    return 'Book{id: $id, title: $title, author: $author, publicationYear: $publicationYear, genre: $genre, isAvailable: $isAvailable, image: $image, category: $category, isFavorite: $isFavorite, isAddedToCart: $isAddedToCart}';
  }
}
