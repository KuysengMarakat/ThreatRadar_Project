class Website {
  final String id;
  final String name;
  final String url;
  final String status;
  final DateTime addTime;

  Website({
    required this.id,
    required this.name,
    required this.url,
    required this.status,
    required this.addTime,
  });

  @override
  String toString() {
    return "Website(name: $name, status: $status)";
  }
}