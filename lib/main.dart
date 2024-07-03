import 'package:dialog_handler/dialog_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation/routes/default_app_router.dart';
import 'utils/locator.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  final appRouter = locator<DefaultAppRouter>();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (val) {
      runApp(
        ProviderScope(
          child: MaterialApp.router(
            routerConfig: appRouter.config(),
            builder: (context, widget) {
              return Navigator(
                onGenerateRoute: (settings) => CupertinoPageRoute(
                  builder: (ctx) => DialogManager(
                    child: widget!,
                  ),
                ),
              );
            },
          ),
        ),
      );
    },
  );
}
