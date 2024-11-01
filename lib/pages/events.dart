import 'package:bibliotechaapp/models/event.dart';
import 'package:bibliotechaapp/pages/library.dart';
import 'package:bibliotechaapp/pages/profile.dart';
import 'package:flutter/material.dart';

final List<Event> sampleEvents = [
  Event(
    title: 'Targi Książek 2024',
    description: 'Wielka wystawa książek z różnych gatunków.',
    date: DateTime(2024, 4, 1),
  ),
  Event(
    title: 'Spotkanie z Autorem',
    description:
        'Spotkanie z ulubionymi autorami i możliwość podpisania książek.',
    date: DateTime(2024, 8, 15),
  ),
  Event(
    title: 'Czytanie Poezji',
    description: 'Wieczór czytania poezji przez lokalnych poetów.',
    date: DateTime(2024, 9, 10),
  ),
  Event(
    title: 'Opowiadanie Dla Dzieci',
    description: 'Sesje opowiadania dla dzieci w wieku od 5 do 10 lat.',
    date: DateTime(2024, 10, 5),
  ),
  Event(
    title: 'Warsztaty Pisarskie',
    description:
        'Warsztaty dla aspirujących pisarzy w celu doskonalenia ich umiejętności.',
    date: DateTime(2024, 11, 20),
  ),
  // Additional events
  Event(
    title: 'Koncert Literacki',
    description: 'Koncert poświęcony muzyce inspirowanej literaturą.',
    date: DateTime(2024, 5, 20),
  ),
  Event(
    title: 'Konkurs Literacki',
    description: 'Konkurs dla autorów na najlepszą krótką opowieść.',
    date: DateTime(2024, 7, 10),
  ),
  Event(
    title: 'Wykład Literaturoznawczy',
    description: 'Wykład na temat współczesnych trendów w literaturze.',
    date: DateTime(2024, 8, 25),
  ),
  Event(
    title: 'Zajęcia Kreatywnego Pisania',
    description: 'Warsztaty na temat kreatywnego pisania opowiadań.',
    date: DateTime(2024, 9, 30),
  ),
  Event(
    title: 'Książkowy Maraton Czytelniczy',
    description: '24-godzinny maraton czytelniczy z ulubionymi książkami.',
    date: DateTime(2024, 11, 5),
  ),
];

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: sampleEvents.length,
            itemBuilder: (context, index) {
              final event = sampleEvents[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading:
                      Icon(Icons.event, color: Theme.of(context).primaryColor),
                  title: Text(
                    event.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    event.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text(
                    '${event.date.day}/${event.date.month}/${event.date.year}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(event.title),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Data: ${event.date.day}/${event.date.month}/${event.date.year}'),
                              const SizedBox(height: 10),
                              Text(event.description),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Zamknij'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ));
  }
}
