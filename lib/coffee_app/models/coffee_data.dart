import 'package:flutter/material.dart';

class CoffeeData {
  final ImageProvider imagePath;
  final String name;
  final String description;
  final Map<String, double> pricesBySize;
  final double rating;
  final int votes;
  final String category;
  final String temperature;
  final List<String> sizes;

  CoffeeData({
    required this.imagePath,
    required this.name,
    required this.description,
    required this.pricesBySize,
    required this.rating,
    required this.votes,
    required this.category,
    required this.temperature,
    this.sizes = const ['S', 'M', 'L'],
  });

  double getPriceForSize(String size) {
    return pricesBySize[size] ?? pricesBySize['M']!;
  }
}
