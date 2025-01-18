import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_app/services/routing/routing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  GoRouter router = AppRouting.router;

  runApp(MyApp(
    route: router,
  ));
}

class MyApp extends StatelessWidget {
  final GoRouter route;
  const MyApp({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (buildContext, orientation, screenType) {
      return GetMaterialApp.router(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        routerDelegate: AppRouting.router.routerDelegate,
        routeInformationParser: AppRouting.router.routeInformationParser,
        routeInformationProvider: AppRouting.router.routeInformationProvider,
      );
    });
  }
}
