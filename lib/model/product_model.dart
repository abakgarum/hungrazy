import 'package:flutter/foundation.dart';

class Product {
  final String name;
  final String imagePath;
  final String price;
  final String unit;
  bool isAddedToCart;
  @required
  Product({this.name, this.imagePath, this.price = '100', this.unit = '/p', this.isAddedToCart = false});

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      imagePath: map['imagePath'],
      price: map['price'],
      unit: map['unit'],
    );
  }
}
