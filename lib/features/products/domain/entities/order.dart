class Order {
  final int? id;
  final DateTime date;
  final double total;

  Order({required this.id, required this.date, required this.total});

  Map<String, dynamic> toMap() => {
    'date': date.toIso8601String(),
    'total': total,
  };

  factory Order.fromMap(Map<String, dynamic> map) => Order(
    id: map['id'],
    date: map['date'],
    total: (map['total'] as num).toDouble(),
  );
}
