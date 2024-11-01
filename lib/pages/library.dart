import 'package:flutter/material.dart';

class LibraryInfoPage extends StatelessWidget {
  const LibraryInfoPage({super.key});

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
          )),
      body: const Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Tutaj są informacje o bibliotece:',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Text(
            'Adres: ul. Biblioteczna 10, 01-000 Warszawa',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'Telefon: +48 123 456 789',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'Godziny otwarcia:',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Pon-Pt: 8:00 - 20:00',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Sob-Nd: 10:00 - 18:00',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
        ]),
      ),
    );
  }
}
