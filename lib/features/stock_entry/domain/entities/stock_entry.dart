class StockEntry {
  final int? id;
  final DateTime createdAt;
  final double total;

  StockEntry({required this.id, required this.createdAt, required this.total});

  Map<String, dynamic> toMap() => {
    'created_at': createdAt.toIso8601String(),
    'total': total,
  };

  factory StockEntry.fromMap(Map<String, dynamic> map) => StockEntry(
    id: map['id'],
    createdAt: DateTime.parse(map['created_at']),
    total: (map['total'] as num).toDouble(),
  );
}
