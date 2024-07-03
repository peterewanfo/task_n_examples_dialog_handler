import 'package:auto_route/auto_route.dart';

import 'default_app_router.gr.dart';
import 'default_routes.dart';

@AutoRouterConfig(generateForDir: ['lib'], replaceInRouteName: "Route")
class DefaultAppRouter extends $DefaultAppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: CalculatorScreen.page,
      path: DefaultRoutes.initRoute,
    ),
    AutoRoute(
      page: ExamplesScreen.page,
      path: DefaultRoutes.dialogExamplesRoute,
    ),
  ];
}
