import 'package:dev_portfolio/coffee_app/models/coffee_data.dart';

import 'coffee_mock_service.dart';

class CoffeeRepository {
  Future<List<CoffeeData>> fetchCoffees() async {
    return CoffeeMockService.fetchCoffees();
  }
}
