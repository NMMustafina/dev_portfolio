import 'package:dev_portfolio/coffee_app/features/features.dart';
import 'package:dev_portfolio/coffee_app/theme/coffee_theme.dart';
import 'package:dev_portfolio/src/src.dart';
import 'package:flutter/material.dart';

class CoffeeOrderScreen extends StatefulWidget {
  final CoffeeData coffee;
  const CoffeeOrderScreen({super.key, required this.coffee});

  @override
  State<CoffeeOrderScreen> createState() => _CoffeeOrderScreenState();
}

class _CoffeeOrderScreenState extends State<CoffeeOrderScreen> {
  bool isDeliverySelected = true;
  int itemCount = 1;
  double deliveryFee = 1.0;
  double get totalPrice => (widget.coffee.price * itemCount) + deliveryFee;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 28,
            color: CoffeeTheme.primaryTextColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Order',
            style: TextStyle(color: CoffeeTheme.primaryTextColor)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: theme.secondaryHeaderColor.withAlpha(90),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isDeliverySelected = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: isDeliverySelected
                              ? theme.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Deliver',
                            style: TextStyle(
                                color: isDeliverySelected
                                    ? CoffeeTheme.secondaryColor
                                    : CoffeeTheme.primaryTextColor,
                                fontWeight: isDeliverySelected
                                    ? FontWeight.w600
                                    : FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isDeliverySelected = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: !isDeliverySelected
                              ? theme.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Pick Up',
                            style: TextStyle(
                                color: !isDeliverySelected
                                    ? CoffeeTheme.secondaryColor
                                    : CoffeeTheme.primaryTextColor,
                                fontWeight: !isDeliverySelected
                                    ? FontWeight.w600
                                    : FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text('Delivery Address', style: theme.textTheme.headlineSmall),
            SizedBox(height: 16),
            Text(
              '7825 Evergreen Hillside Avenue',
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: CoffeeTheme.primaryTextColor),
            ),
            Text('Mountain View, CA', style: theme.textTheme.bodySmall),
            SizedBox(height: 16),
            Row(
              children: [
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    side: BorderSide(color: CoffeeTheme.searchFieldColor),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.edit,
                      size: 16, color: CoffeeTheme.searchFieldColor),
                  label: Text(
                    'Edit Address',
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: CoffeeTheme.searchFieldColor),
                  ),
                ),
                SizedBox(width: 10),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    side: BorderSide(color: CoffeeTheme.searchFieldColor),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.note_add,
                      size: 16, color: CoffeeTheme.searchFieldColor),
                  label: Text(
                    'Add Note',
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: CoffeeTheme.searchFieldColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(
              color: theme.secondaryHeaderColor.withAlpha(90),
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: widget.coffee.imagePath,
                  fit: BoxFit.cover,
                  width: 54,
                  height: 54,
                ),
              ),
              title: Text(
                widget.coffee.name,
                style: theme.textTheme.headlineSmall,
              ),
              subtitle: Text(
                widget.coffee.category,
                style: theme.textTheme.bodySmall,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: itemCount > 1
                        ? () {
                            setState(() {
                              itemCount--;
                            });
                          }
                        : null,
                  ),
                  SizedBox(
                    width: 24,
                    child: Center(
                      child: Text(
                        '$itemCount',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        itemCount++;
                      });
                    },
                  ),
                ],
              ),
            ),
            Divider(
              color: theme.secondaryHeaderColor.withAlpha(90),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: theme.secondaryHeaderColor.withAlpha(90)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Assets.coffeeApp.icons.discount.svg(
                        height: 20,
                        width: 20,
                        colorFilter: ColorFilter.mode(
                          CoffeeTheme.primaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text('1 Discount is Applied',
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: CoffeeTheme.primaryTextColor)),
                    ],
                  ),
                  Icon(Icons.chevron_right,
                      color: CoffeeTheme.primaryTextColor),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Payment Summary', style: theme.textTheme.headlineSmall),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price',
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: CoffeeTheme.primaryTextColor),
                    ),
                    Text(
                      '\$${(widget.coffee.price * itemCount).toStringAsFixed(2)}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: CoffeeTheme.primaryTextColor),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Fee',
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: CoffeeTheme.primaryTextColor),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$2.0',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: CoffeeTheme.primaryTextColor,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '\$${deliveryFee.toStringAsFixed(2)}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: CoffeeTheme.primaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: CoffeeTheme.secondaryColor,
          boxShadow: [
            BoxShadow(
              color: CoffeeTheme.darkBackgroundColor.withAlpha(25),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Assets.coffeeApp.icons.wallet.svg(
                      height: 20,
                      width: 20,
                      colorFilter: ColorFilter.mode(
                        CoffeeTheme.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cash/Wallet',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: CoffeeTheme.primaryTextColor,
                          ),
                        ),
                        Text(
                          '\$${totalPrice.toStringAsFixed(2)}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: CoffeeTheme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.black54),
              ],
            ),
            SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: theme.elevatedButtonTheme.style,
                onPressed: () {},
                child: Text('Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
