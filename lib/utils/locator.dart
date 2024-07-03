import 'package:dialog_handler/dialog_handler.dart';
import 'package:get_it/get_it.dart';

import '../presentation/routes/default_app_router.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {

  /// Register App Router
  final appRouter = DefaultAppRouter();
  locator.registerSingleton(appRouter);

  /// Register Dialog Handler
  locator.registerLazySingleton<DialogHandler>(
    () => DialogHandler.instance,
  );

}
