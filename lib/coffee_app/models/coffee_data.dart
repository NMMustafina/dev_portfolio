import 'package:flutter/material.dart';

class CoffeeData {
  final ImageProvider imagePath;
  final String name;
  final String description;
  final double price;
  final double rating;
  final int votes;
  final String category;
  final String temperature;
  final List<String> sizes;

  CoffeeData({
    required this.imagePath,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.votes,
    required this.category,
    required this.temperature,
    this.sizes = const ['S', 'M', 'L'],
  });
}
