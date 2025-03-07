import 'package:dev_portfolio/coffee_app/theme/coffee_theme.dart';
import 'package:dev_portfolio/src/src.dart';
import 'package:flutter/material.dart';

class CoffeeIconsRow extends StatelessWidget {
  const CoffeeIconsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIcon(Assets.coffeeApp.icons.bike.image()),
        SizedBox(width: 12),
        _buildIcon(Assets.coffeeApp.icons.bean.image()),
        SizedBox(width: 12),
        _buildIcon(Assets.coffeeApp.icons.milk.image()),
      ],
    );
  }

  Widget _buildIcon(Image image) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CoffeeTheme.secondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(height: 20, width: 20, child: image),
    );
  }
}
