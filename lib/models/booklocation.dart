class BookomatLocation {
  final String name;
  final String address;

  BookomatLocation({required this.name, required this.address});

  @override
  String toString() {
    return 'BookomatLocation{name: $name, address: $address}';
  }
}
