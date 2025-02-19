import 'package:auto_route/auto_route.dart';
import 'package:dev_portfolio/coffee_app/features/features.dart';
import 'package:dev_portfolio/fitness_app/features/features.dart';
import 'package:dev_portfolio/navigator/view/navigator_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: NavigatorRoute.page, path: '/'),
        AutoRoute(page: CoffeeWelcomeRoute.page, path: '/coffee_app'),
        AutoRoute(page: CoffeeHomeRoute.page, path: '/coffee_app/home'),
        AutoRoute(page: FitnessWelcomeRoute.page, path: '/fitness_app'),
        AutoRoute(page: FitnessHomeRoute.page, path: '/fitness_app/home'),
      ];
}
