import 'package:bibliotechaapp/provider/manager.dart';
import 'package:bibliotechaapp/pages/catalog.dart';
import 'package:bibliotechaapp/pages/events.dart';
import 'package:bibliotechaapp/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MyHomePage(),
    const CatalogPage(),
    const EventsPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Manager(),
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Strona Główna',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Katalog',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: 'Wydarzenia',
            ),
          ],
        ),
      ),
    );
  }
}
