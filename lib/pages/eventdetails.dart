import 'package:bibliotechaapp/models/event.dart';
import 'package:flutter/material.dart';

class EventDetailsPage extends StatelessWidget {
  final Event event;

  const EventDetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Opis:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(event.description),
            const SizedBox(height: 16),
            const Text(
              'Data:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'dnia ${event.date.day}-${event.date.month}-${event.date.year}',
            ),
          ],
        ),
      ),
    );
  }
}
