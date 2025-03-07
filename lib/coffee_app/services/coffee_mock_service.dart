import 'package:dev_portfolio/coffee_app/models/models.dart';
import 'package:dev_portfolio/src/src.dart';

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
      price: 4.15,
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
