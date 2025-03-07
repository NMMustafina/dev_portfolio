import 'package:dev_portfolio/coffee_app/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CategoryTabs extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CategoryTabs({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [
      'All Coffee',
      'Cappuccino',
      'Americano',
      'Espresso',
      'Latte'
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map((category) => Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () => onCategorySelected(category),
                    child: CategoryButton(category,
                        isSelected: category == selectedCategory),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
