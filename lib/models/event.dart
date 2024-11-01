class Event {
  final String title;
  final String description;
  final DateTime date;
  final String location;

  Event({
    required this.title,
    required this.description,
    required this.date,
    this.location = '',
  });

  @override
  String toString() {
    return 'Event(title: $title, description: $description, date: $date, location: $location)';
  }
}
