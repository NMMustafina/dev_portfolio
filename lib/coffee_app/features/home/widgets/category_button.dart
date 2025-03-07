import 'package:dev_portfolio/coffee_app/theme/coffee_theme.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CategoryButton(this.text, {super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color:
            isSelected ? CoffeeTheme.primaryColor : CoffeeTheme.secondaryColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: isSelected
              ? CoffeeTheme.secondaryColor
              : CoffeeTheme.primaryTextColor,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    );
  }
}
