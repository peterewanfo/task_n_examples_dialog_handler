// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:dialog_handler_examples/presentation/views/calculator_screen.dart'
    as _i1;
import 'package:dialog_handler_examples/presentation/views/examples_screen.dart'
    as _i2;

abstract class $DefaultAppRouter extends _i3.RootStackRouter {
  $DefaultAppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    CalculatorScreen.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CalculatorScreen(),
      );
    },
    ExamplesScreen.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ExamplesScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CalculatorScreen]
class CalculatorScreen extends _i3.PageRouteInfo<void> {
  const CalculatorScreen({List<_i3.PageRouteInfo>? children})
      : super(
          CalculatorScreen.name,
          initialChildren: children,
        );

  static const String name = 'CalculatorScreen';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ExamplesScreen]
class ExamplesScreen extends _i3.PageRouteInfo<void> {
  const ExamplesScreen({List<_i3.PageRouteInfo>? children})
      : super(
          ExamplesScreen.name,
          initialChildren: children,
        );

  static const String name = 'ExamplesScreen';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
