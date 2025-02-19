import 'package:auto_route/auto_route.dart';
import 'package:dev_portfolio/src/src.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CoffeeHomeScreen extends StatefulWidget {
  const CoffeeHomeScreen({super.key});

  @override
  State<CoffeeHomeScreen> createState() => _CoffeeHomeScreenState();
}

class _CoffeeHomeScreenState extends State<CoffeeHomeScreen> {
  late Future<List<CoffeeData>> _coffeeFuture;

  @override
  void initState() {
    super.initState();
    _coffeeFuture = CoffeeMockService.fetchCoffees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Assets.coffeeApp.icons.home.svg(
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                  Color(0xFFC67C4E),
                  BlendMode.srcIn,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Assets.coffeeApp.icons.heart.svg(
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                  Color(0xFFA2A2A2),
                  BlendMode.srcIn,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Assets.coffeeApp.icons.bag.svg(
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                  Color(0xFFA2A2A2),
                  BlendMode.srcIn,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Assets.coffeeApp.icons.notification.svg(
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                  Color(0xFFA2A2A2),
                  BlendMode.srcIn,
                ),
              ),
              label: ''),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: 280,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF111111),
                  Color(0xFF313131),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA2A2A2),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Warsaw, Poland",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFD8D8D8),
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFFD8D8D8),
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search coffee",
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(12),
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: Assets.coffeeApp.icons.search.svg(
                                  colorFilter: ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.grey[800],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFA2A2A2),
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Color(0xFFC67C4E),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Assets.coffeeApp.icons.filter.svg(
                            height: 20,
                            width: 20,
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  PromoCard(),
                  SizedBox(height: 16),
                  CategoryTabs(),
                  SizedBox(height: 16),
                  Expanded(
                    child: FutureBuilder<List<CoffeeData>>(
                      future: _coffeeFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Center(child: Text('No coffee found'));
                        }
                        final coffeeList = snapshot.data!;
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: coffeeList.length,
                          itemBuilder: (context, index) {
                            return CoffeeCard(coffee: coffeeList[index]);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  const PromoCard({super.key});

  @override
  Widget build(BuildContext context) {
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
              color: Color(0xFFED5151),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Promo",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
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
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Buy one get",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
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
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "one FREE",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryButton("All Coffee", isSelected: true),
          SizedBox(width: 12),
          CategoryButton("Macchiato"),
          SizedBox(width: 12),
          CategoryButton("Latte"),
          SizedBox(width: 12),
          CategoryButton("Americano"),
          SizedBox(width: 12),
          CategoryButton("Espresso"),
          SizedBox(width: 12),
          CategoryButton("Cappuccino"),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CategoryButton(this.text, {super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFFC67C4E) : Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: isSelected ? Colors.white : Color(0xFF313131),
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    );
  }
}

class CoffeeData {
  final ImageProvider imagePath;
  final String name;
  final String description;
  final double price;
  final double rating;

  CoffeeData({
    required this.imagePath,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
  });
}

class CoffeeMockService {
  static Future<List<CoffeeData>> fetchCoffees() async {
    await Future.delayed(Duration(seconds: 1));
    return _mockCoffees;
  }

  static final List<CoffeeData> _mockCoffees = [
    CoffeeData(
      imagePath: Assets.coffeeApp.images.coffee1.provider(),
      name: 'Caffe Mocha',
      description: 'Deep Foam',
      price: 4.53,
      rating: 4.7,
    ),
    CoffeeData(
      imagePath: Assets.coffeeApp.images.coffee2.provider(),
      name: 'Flat White',
      description: 'Espresso',
      price: 3.53,
      rating: 4.5,
    ),
    CoffeeData(
      imagePath: Assets.coffeeApp.images.coffee3.provider(),
      name: 'Latte',
      description: 'Milk Foam',
      price: 3.99,
      rating: 4.2,
    ),
    CoffeeData(
      imagePath: Assets.coffeeApp.images.coffee4.provider(),
      name: 'Cappuccino',
      description: 'Creamy',
      price: 4.20,
      rating: 4.8,
    ),
  ];
}

class CoffeeCard extends StatelessWidget {
  final CoffeeData coffee;

  const CoffeeCard({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: coffee.imagePath,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Color(0xFFFBBE21), size: 16),
                        SizedBox(width: 4),
                        Text(
                          coffee.rating.toString(),
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffee.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF242424),
                  ),
                ),
                Text(
                  coffee.description,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFA2A2A2),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${coffee.price}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF242424),
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Color(0xFFC67C4E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(Icons.add, color: Colors.white, size: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
