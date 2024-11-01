import 'package:bibliotechaapp/provider/manager.dart';
import 'package:bibliotechaapp/models/book.dart';
import 'package:bibliotechaapp/pages/deliveryoptions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  final List<Book> cartBooks;

  const CartPage({super.key, required this.cartBooks});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Book> _cartBooks;

  @override
  void initState() {
    super.initState();
    _cartBooks = List.from(widget.cartBooks);
  }

  void _removeFromCart(Book book) {
    setState(() {
      _cartBooks.remove(book);
    });
  }

  void _navigateToDeliveryOptions(BuildContext context) {
    final manager = Provider.of<Manager>(context, listen: false);
    manager.addReservedBooks(_cartBooks);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeliveryOptionsPage(cartBooks: _cartBooks),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twoje zamówienie'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartBooks.length,
              itemBuilder: (BuildContext context, int index) {
                final book = _cartBooks[index];
                return Dismissible(
                  key: Key(book.id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    _removeFromCart(book);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('${book.title} usunięto z zamówienia')),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: ListTile(
                    title: Text(book.title),
                    subtitle: Text(book.author),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeFromCart(book),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: ElevatedButton(
                  onPressed: _cartBooks.isEmpty
                      ? null
                      : () => _navigateToDeliveryOptions(context),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 32.0,
                      ),
                      backgroundColor: const Color(0xff3A3E61)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Wybierz fornę dostawy',
                        style: TextStyle(fontSize: 18.0, color: Colors.white)),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
