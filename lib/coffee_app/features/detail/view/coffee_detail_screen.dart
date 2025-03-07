import 'package:dev_portfolio/coffee_app/features/detail/widgets/widgets.dart';
import 'package:dev_portfolio/coffee_app/features/features.dart';
import 'package:dev_portfolio/coffee_app/models/models.dart';
import 'package:dev_portfolio/coffee_app/theme/coffee_theme.dart';
import 'package:dev_portfolio/src/src.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CoffeeDetailScreen extends StatefulWidget {
  final CoffeeData coffee;

  const CoffeeDetailScreen({super.key, required this.coffee});

  @override
  State<CoffeeDetailScreen> createState() => _CoffeeDetailScreenState();
}

class _CoffeeDetailScreenState extends State<CoffeeDetailScreen> {
  String selectedSize = 'M';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
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
        title: Text('Detail',
            style: TextStyle(color: CoffeeTheme.primaryTextColor)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Assets.coffeeApp.icons.heart.svg(
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(
                CoffeeTheme.primaryTextColor,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image(
                  image: widget.coffee.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200),
            ),
            SizedBox(height: 16),
            Text(widget.coffee.name, style: theme.textTheme.headlineMedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Ice/Hot',
                  style: theme.textTheme.bodySmall,
                ),
                CoffeeIconsRow(),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Assets.coffeeApp.icons.star.svg(
                  height: 20,
                  width: 20,
                  colorFilter: ColorFilter.mode(
                    CoffeeTheme.ratingStarColor,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 6),
                Text('${widget.coffee.rating}',
                    style: theme.textTheme.headlineSmall),
                SizedBox(width: 6),
                Text('(${widget.coffee.votes})',
                    style: theme.textTheme.bodySmall),
              ],
            ),
            Divider(
              color: theme.secondaryHeaderColor.withAlpha(90),
            ),
            SizedBox(height: 16),
            Text('Description', style: theme.textTheme.headlineSmall),
            SizedBox(height: 8),
            ReadMoreText(
              widget.coffee.description,
              textAlign: TextAlign.justify,
              trimMode: TrimMode.Line,
              trimLines: 3,
              colorClickableText: theme.primaryColor,
              trimCollapsedText: 'Read More',
              trimExpandedText: ' Show less',
              moreStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: theme.primaryColor),
            ),
            SizedBox(height: 16),
            Text('Size', style: theme.textTheme.headlineSmall),
            SizedBox(height: 16),
            CoffeeSizeSelector(
              sizes: widget.coffee.sizes,
              selectedSize: selectedSize,
              onSizeSelected: (size) {
                setState(() {
                  selectedSize = size;
                });
              },
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Price',
                  style: theme.textTheme.bodySmall,
                ),
                SizedBox(height: 4),
                Text(
                  'Price: \$${widget.coffee.getPriceForSize(selectedSize).toStringAsFixed(2)}',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontSize: 18,
                    color: theme.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(width: 34),
            Expanded(
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CoffeeOrderScreen(
                      coffee: widget.coffee,
                      selectedSize: selectedSize,
                    ),
                  ),
                ),
                style: theme.elevatedButtonTheme.style,
                child: Text(
                  'Buy Now',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
