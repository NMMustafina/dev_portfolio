import 'package:dev_portfolio/coffee_app/features/features.dart';
import 'package:dev_portfolio/coffee_app/theme/coffee_theme.dart';
import 'package:dev_portfolio/src/src.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoffeeHomeScreen extends StatefulWidget {
  const CoffeeHomeScreen({super.key});

  @override
  State<CoffeeHomeScreen> createState() => _CoffeeHomeScreenState();
}

class _CoffeeHomeScreenState extends State<CoffeeHomeScreen> {
  late Future<List<CoffeeData>> _coffeeFuture;
  String _selectedCategory = "All Coffee";
  String _currentLocation = "Loading...";

  @override
  void initState() {
    super.initState();
    _coffeeFuture = CoffeeMockService.fetchCoffees();
    _loadLocation();
  }

  Future<void> _loadLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLocation = prefs.getString("selected_location");

    if (savedLocation != null) {
      setState(() {
        _currentLocation = savedLocation;
      });
    } else {
      _determineLocation();
    }
  }

  Future<void> _determineLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _currentLocation = "Location disabled";
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _currentLocation = "Permission denied";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _currentLocation = "Permission denied forever";
      });
      return;
    }

    Future<void> requestPermission() async {
      var status = await Permission.location.request();

      if (status.isDenied) {
        print("Location permission denied");
      }

      if (status.isPermanentlyDenied) {
        await openAppSettings();
      }
    }

    await requestPermission();

    Position position = await Geolocator.getCurrentPosition();
    _getAddressFromCoordinates(position);
  }

  Future<void> _getAddressFromCoordinates(Position position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        String city = place.locality ?? "Unknown City";
        String country = place.country ?? "Unknown Country";

        setState(() {
          _currentLocation = "$city, $country";
        });

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("selected_location", _currentLocation);
      }
    } catch (e) {
      print("Error in geocoding: $e");
      setState(() {
        _currentLocation = "Location not found";
      });
    }
  }

  Future<void> _showLocationDialog() async {
    List<String> cities = [
      "New York",
      "Los Angeles",
      "London",
      "Warsaw",
      "Tokyo"
    ];
    String? selectedCity = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Select Location"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: cities
                .map((city) => ListTile(
                      title: Text(city),
                      onTap: () {
                        Navigator.pop(context, city);
                      },
                    ))
                .toList(),
          ),
        );
      },
    );

    if (selectedCity != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("selected_location", selectedCity);
      setState(() {
        _currentLocation = selectedCity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          Container(
            height: 280,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  CoffeeTheme.darkBackgroundColor,
                  CoffeeTheme.searchFieldFillColor,
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
                  Text("Location", style: theme.textTheme.bodySmall),
                  GestureDetector(
                    onTap: _showLocationDialog,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _currentLocation,
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.keyboard_arrow_down,
                            color: theme.secondaryHeaderColor, size: 16),
                      ],
                    ),
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
                                    CoffeeTheme.secondaryColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: CoffeeTheme.secondaryColor),
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Assets.coffeeApp.icons.filter.svg(
                            height: 20,
                            width: 20,
                            colorFilter: ColorFilter.mode(
                              CoffeeTheme.secondaryColor,
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
                  CategoryTabs(
                    selectedCategory: _selectedCategory,
                    onCategorySelected: (String category) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  ),
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
                        final coffeeList = snapshot.data!
                            .where((coffee) =>
                                _selectedCategory == "All Coffee" ||
                                coffee.category == _selectedCategory)
                            .toList();
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Assets.coffeeApp.icons.home.svg(
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                  theme.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Assets.coffeeApp.icons.heart.svg(
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                  theme.secondaryHeaderColor,
                  BlendMode.srcIn,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Assets.coffeeApp.icons.bag.svg(
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                  theme.secondaryHeaderColor,
                  BlendMode.srcIn,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Assets.coffeeApp.icons.notification.svg(
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                  theme.secondaryHeaderColor,
                  BlendMode.srcIn,
                ),
              ),
              label: ''),
        ],
      ),
    );
  }
}

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
              "Promo",
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
                  Text("Buy one get", style: theme.textTheme.headlineLarge),
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
                  Text("one FREE", style: theme.textTheme.headlineLarge),
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
      "All Coffee",
      "Cappuccino",
      "Americano",
      "Espresso",
      "Latte"
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

class CoffeeMockService {
  static Future<List<CoffeeData>> fetchCoffees() async {
    await Future.delayed(Duration(seconds: 1));
    return _mockCoffees;
  }

  static final List<CoffeeData> _mockCoffees = [
    CoffeeData(
      imagePath: Assets.coffeeApp.images.coffee1.provider(),
      name: 'Cloudy Foam',
      description:
          'Americano is a classic coffee drink made by diluting espresso with hot water. This preparation method gives Americano a milder taste compared to pure espresso while preserving its characteristic aroma and slight bitterness.\n\nTraditionally, an Americano is made by adding 90–150 ml of hot water to 30 ml of espresso, making it similar in strength to filter coffee but with a richer flavor. This drink is popular among those who enjoy a smooth yet invigorating coffee without milk.\n\nIt is believed that Americano originated during World War II when American soldiers in Europe diluted strong Italian espresso with water to resemble the filter coffee they were accustomed to.',
      price: 4.53,
      rating: 4.7,
      votes: 230,
      category: 'Americano',
      temperature: 'Ice/Hot',
    ),
    CoffeeData(
      imagePath: Assets.coffeeApp.images.coffee2.provider(),
      name: 'Midnight Brew',
      description:
          'Espresso is a strong and rich coffee made by forcing hot water under high pressure through finely ground coffee beans. It has a dense texture, intense flavor, and a thick crema.\n\nThis drink serves as the base for many popular coffee variations, such as cappuccino, latte, and macchiato. A true espresso should have a rich aroma, a balanced bitterness, and a slight acidity.\n\nItalians consider it an art and drink it in small sips, savoring every drop. A classic espresso is served in a small cup (demitasse) and typically consists of 30 ml (1 ounce) of coffee. A double espresso, or “doppio,” contains 60 ml (2 ounces). There are also variations like ristretto, which is a more concentrated 15-20 ml shot, and lungo, which is a longer 50-60 ml shot with more water.',
      price: 3.53,
      rating: 4.5,
      votes: 180,
      category: 'Espresso',
      temperature: 'Hot',
    ),
    CoffeeData(
      imagePath: Assets.coffeeApp.images.coffee3.provider(),
      name: 'Crema Latte',
      description:
          'Latte is a popular coffee drink made with espresso, a large amount of milk, and a light milk foam. This gives latte a smooth, creamy taste with a delicate texture, making it a perfect choice for those who prefer a milder coffee.\n\nA classic latte consists of 30–60 ml of espresso and about 200–250 ml of hot milk, topped with a small layer of foam. The drink is often served in a tall glass, and in coffee shops, baristas create beautiful designs on its surface – known as latte art.\n\nLatte is especially popular among those who enjoy sweet and flavored drinks, as its taste pairs well with syrups like vanilla, caramel, or hazelnut.',
      price: 3.99,
      rating: 4.2,
      votes: 200,
      category: 'Latte',
      temperature: 'Ice/Hot',
    ),
    CoffeeData(
      imagePath: Assets.coffeeApp.images.coffee4.provider(),
      name: 'Caramel Dream',
      description:
          'Cappuccino is a classic Italian coffee drink made with espresso, hot milk, and airy milk foam. It has a rich flavor and a velvety texture, creating the perfect balance between the strength of coffee and the smoothness of milk.\n\nTraditionally, cappuccino is prepared in a 1:1:1 ratio – one part espresso (30 ml), one part milk, and one part thick milk foam. The drink is served in a cup of 150–180 ml, and it can be topped with cocoa or cinnamon for extra aroma.\n\nCappuccino is popular worldwide and is often enjoyed in the morning, as the combination of caffeine and milk makes it both invigorating and smooth, offering a pleasant and balanced taste.',
      price: 4.20,
      rating: 4.8,
      votes: 250,
      category: 'Cappuccino',
      temperature: 'Hot',
    ),
  ];
}

class CoffeeCard extends StatelessWidget {
  final CoffeeData coffee;

  const CoffeeCard({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: CoffeeTheme.secondaryColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CoffeeDetailScreen(coffee: coffee),
                  ),
                );
              },
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: CoffeeTheme.ratingContainerDecoration,
                      child: Row(
                        children: [
                          Assets.coffeeApp.icons.star.svg(
                            height: 14,
                            width: 14,
                            colorFilter: ColorFilter.mode(
                              CoffeeTheme.ratingStarColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            coffee.rating.toString(),
                            style: theme.textTheme.headlineLarge?.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffee.name,
                  style: theme.textTheme.headlineSmall,
                ),
                Text(
                  coffee.category,
                  style: theme.textTheme.bodySmall,
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${coffee.price}',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(Icons.add,
                            color: CoffeeTheme.secondaryColor, size: 16),
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
