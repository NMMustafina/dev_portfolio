import 'package:dev_portfolio/coffee_app/theme/coffee_theme.dart';
import 'package:dev_portfolio/src/src.dart';
import 'package:flutter/material.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: Assets.coffeeApp.images.promoBanner.provider(),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              color: CoffeeTheme.promoColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Promo',
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: CoffeeTheme.secondaryColor),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 20,
                    child: Container(
                      width: 200,
                      height: 24,
                      color: CoffeeTheme.darkBackgroundColor,
                    ),
                  ),
                  Text('Buy one get', style: theme.textTheme.headlineLarge),
                ],
              ),
              SizedBox(height: 4),
              Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 20,
                    child: Container(
                      width: 160,
                      height: 24,
                      color: CoffeeTheme.darkBackgroundColor,
                    ),
                  ),
                  Text('one FREE', style: theme.textTheme.headlineLarge),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
