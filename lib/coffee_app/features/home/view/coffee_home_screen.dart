import 'package:dev_portfolio/coffee_app/features/home/widgets/widgets.dart';
import 'package:dev_portfolio/coffee_app/models/models.dart';
import 'package:dev_portfolio/coffee_app/services/services.dart';
import 'package:dev_portfolio/coffee_app/theme/coffee_theme.dart';
import 'package:dev_portfolio/src/src.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoffeeHomeScreen extends StatefulWidget {
  const CoffeeHomeScreen({super.key});

  @override
  State<CoffeeHomeScreen> createState() => _CoffeeHomeScreenState();
}

class _CoffeeHomeScreenState extends State<CoffeeHomeScreen> {
  late Future<List<CoffeeData>> _coffeeFuture;
  final CoffeeRepository _coffeeRepository = CoffeeRepository();
  final LocationService _locationService = LocationService();
  final CountryService _countryService = CountryService();
  late Future<List<String>> _countriesFuture;
  String _selectedCategory = 'All Coffee';
  String _currentLocation = 'Loading...';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _coffeeFuture = _coffeeRepository.fetchCoffees();
    _loadLocation();
    _countriesFuture = _countryService.fetchCountries();
  }

  Future<void> _loadLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLocation = prefs.getString('selected_location');

    if (savedLocation != null) {
      setState(() {
        _currentLocation = savedLocation;
      });
    } else {
      _fetchLocation();
    }
  }

  Future<void> _fetchLocation() async {
    String location = await _locationService.getCurrentLocation();
    setState(() {
      _currentLocation = location;
    });
  }

  Future<void> _showCountryDialog() async {
    List<String> countries = await _countriesFuture;

    if (!mounted) {
      return;
    }

    String? selectedCountry = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select your country'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: countries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(countries[index]),
                  onTap: () {
                    Navigator.pop(context, countries[index]);
                  },
                );
              },
            ),
          ),
        );
      },
    );

    if (!mounted) return;

    if (selectedCountry != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('selected_location', selectedCountry);

      if (!mounted) return;
      setState(() {
        _currentLocation = selectedCountry;
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
                  CoffeeTheme.searchFieldColor,
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
                  Text('Location', style: theme.textTheme.bodySmall),
                  GestureDetector(
                    onTap: _showCountryDialog,
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
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Search coffee',
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
                          onChanged: (query) {
                            setState(() {
                              _searchQuery = query;
                            });
                          },
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
                                (_selectedCategory == 'All Coffee' ||
                                    coffee.category == _selectedCategory) &&
                                (_searchQuery.isEmpty ||
                                    coffee.name
                                        .toLowerCase()
                                        .contains(_searchQuery.toLowerCase())))
                            .toList();

                        return coffeeList.isEmpty
                            ? Center(child: Text('No matching coffee found'))
                            : GridView.builder(
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
