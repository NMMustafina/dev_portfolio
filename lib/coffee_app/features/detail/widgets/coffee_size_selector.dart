import 'package:dev_portfolio/coffee_app/theme/coffee_theme.dart';
import 'package:flutter/material.dart';

class CoffeeSizeSelector extends StatelessWidget {
  final List<String> sizes;
  final String selectedSize;
  final ValueChanged<String> onSizeSelected;

  const CoffeeSizeSelector({
    super.key,
    required this.sizes,
    required this.selectedSize,
    required this.onSizeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: sizes
          .map(
            (size) => Expanded(
              child: GestureDetector(
                onTap: () => onSizeSelected(size),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selectedSize == size
                        ? theme.primaryColor.withAlpha(25)
                        : Colors.transparent,
                    border: Border.all(
                      color: selectedSize == size
                          ? theme.primaryColor
                          : theme.secondaryHeaderColor.withAlpha(75),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    size,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: selectedSize == size
                          ? theme.primaryColor
                          : CoffeeTheme.primaryTextColor,
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList()
          .expand((widget) => [widget, SizedBox(width: 16)])
          .toList()
        ..removeLast(),
    );
  }
}
