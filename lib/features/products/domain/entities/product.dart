class Product {
  final int? id;
  final String code;
  final String name;
  final int categoryId;
  final double buyPrice;
  final double sellPrice;
  final int stock;

  Product({
    this.id,
    required this.code,
    required this.name,
    required this.categoryId,
    required this.buyPrice,
    required this.sellPrice,
    required this.stock,
  });

  Map<String, dynamic> toMap() => {
    'code': code,
    'name': name,
    'category_id': categoryId,
    'buy_price': buyPrice,
    'sell_price': sellPrice,
    'stock': stock,
  };

  factory Product.fromMap(Map<String, dynamic> map) => Product(
    id: map['id'],
    code: map['code'],
    name: map['name'],
    categoryId: map['category_id'],
    buyPrice: (map['buy_price'] as num).toDouble(),
    sellPrice: (map['sell_price'] as num).toDouble(),
    stock: map['stock'],
  );
}
