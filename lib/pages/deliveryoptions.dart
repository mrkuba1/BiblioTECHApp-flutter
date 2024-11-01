import 'package:bibliotechaapp/models/booklocation.dart';
import 'package:bibliotechaapp/pages/thankyou.dart';
import 'package:flutter/material.dart';
import 'package:bibliotechaapp/models/book.dart';

final List<BookomatLocation> bookomatLocations = [
  BookomatLocation(name: 'WEITI 1', address: 'Park'),
  BookomatLocation(name: 'WEITI 2', address: 'Piwnica'),
  BookomatLocation(name: 'WEITI 3', address: 'Audytorium'),
  BookomatLocation(name: 'GG 1', address: 'Stołówka'),
  BookomatLocation(name: 'WIL 1', address: 'Piwnica'),
  BookomatLocation(name: 'MCHTR 1', address: 'Hol Główny'),
  BookomatLocation(name: 'MEiL 1', address: 'Biblioteka'),
  BookomatLocation(name: 'Mini 1', address: 'Taras'),
  BookomatLocation(name: 'Olimp 1', address: 'Recepcja'),
  BookomatLocation(name: 'CIE 1', address: 'Wejście główne'),
  BookomatLocation(name: 'WRT 1', address: 'Kawiarnia'),
  BookomatLocation(name: 'WIPOS 1', address: 'Plac wewnętrzny'),
  BookomatLocation(name: 'FA 1', address: 'Pokój studencki'),
  BookomatLocation(name: 'IL 1', address: 'Pokój komputerowy'),
  BookomatLocation(name: 'IC 1', address: 'Biuro studentów'),
  BookomatLocation(name: 'WTK 1', address: 'Hol wschodni'),
  BookomatLocation(name: 'WN 1', address: 'Ogród'),
  BookomatLocation(name: 'WSP 1', address: 'Dziedziniec'),
  BookomatLocation(name: 'FS 1', address: 'Sala konferencyjna'),
  BookomatLocation(name: 'WIMiR 1', address: 'Korytarz'),
  BookomatLocation(name: 'WC 1', address: 'Plac zabaw'),
  BookomatLocation(name: 'WOB 1', address: 'Budynek główny'),
  BookomatLocation(name: 'MOB 1', address: 'Sala wykładowa'),
  BookomatLocation(name: 'IS 1', address: 'Foyer'),
  BookomatLocation(name: 'IT 1', address: 'Strefa relaksu'),
];

class DeliveryOptionsPage extends StatefulWidget {
  final List<Book> cartBooks;

  const DeliveryOptionsPage({super.key, required this.cartBooks});

  @override
  _DeliveryOptionsPageState createState() => _DeliveryOptionsPageState();
}

class _DeliveryOptionsPageState extends State<DeliveryOptionsPage> {
  String _selectedDeliveryOption = 'Odbiór w siedzibie';
  BookomatLocation? _selectedBookomat;

  void _reserveBooks() {
    if (_selectedDeliveryOption == 'Książkomat' && _selectedBookomat == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Należy wybrać opcję'),
            content: const Text('Proszę wybrać książkomat'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ThankYouPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wybierz formę dostawy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RadioListTile<String>(
              title: const Text('Odbiór w siedzibie '),
              value: 'Odbiór w siedzibie',
              groupValue: _selectedDeliveryOption,
              onChanged: (value) {
                setState(() {
                  _selectedDeliveryOption = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Książkomat'),
              value: 'Książkomat',
              groupValue: _selectedDeliveryOption,
              onChanged: (value) {
                setState(() {
                  _selectedDeliveryOption = value!;
                  _selectedBookomat = null; // Reset bookomat selection
                });
              },
            ),
            if (_selectedDeliveryOption == 'Książkomat')
              Expanded(
                child: ListView.builder(
                  itemCount: bookomatLocations.length,
                  itemBuilder: (context, index) {
                    final location = bookomatLocations[index];
                    return RadioListTile<BookomatLocation>(
                      title: Text(location.name),
                      subtitle: Text(location.address),
                      value: location,
                      groupValue: _selectedBookomat,
                      onChanged: (value) {
                        setState(() {
                          _selectedBookomat = value!;
                        });
                      },
                    );
                  },
                ),
              ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: _reserveBooks,
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 150.0,
                  ),
                  backgroundColor: const Color(0xff3A3E61)),
              child: const Text(
                'Akceptuje',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
