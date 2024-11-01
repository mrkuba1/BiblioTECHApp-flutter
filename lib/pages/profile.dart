import 'package:bibliotechaapp/provider/manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfilePage extends StatelessWidget {
  final String userName = "Jan Kowalski";
  final String userEmail = "jan.kowalski@example.com";
  final String userPhotoUrl =
      "https://images.unsplash.com/photo-1609010697446-11f2155278f0?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  final String qrUrl = "https://i.imgur.com/lSyNqdE.png";

  const UserProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil użytkownika',
          style: TextStyle(color: Color(0xff2c3373)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(userPhotoUrl),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                userName,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2c3373)),
              ),
            ),
            Center(
              child: Text(
                userEmail,
                style: const TextStyle(fontSize: 18, color: Color(0xff3A3E61)),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Zamówienia:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2c3373)),
            ),
            Consumer<Manager>(
              builder: (context, favoritesManager, child) {
                final reservedBooks = favoritesManager.reservedBooks;
                if (reservedBooks.isEmpty) {
                  return const Center(
                      child: Column(
                    children: [
                      Text('Nie masz jeszcze żadnych zamówionych książek'),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ));
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: reservedBooks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading:
                            const Icon(Icons.book, color: Color(0xff2C3373)),
                        title: Text(
                          reservedBooks[index].title,
                          style: const TextStyle(color: Color(0xff3A3E61)),
                        ),
                        subtitle: Text(reservedBooks[index].author),
                      );
                    },
                  ),
                );
              },
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.width * 0.6,
                child: Image.network(
                  qrUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
