import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/services/routing/routepath.dart';
import 'package:travel_app/src/views/screens/bottom_navbar.dart';
import 'package:travel_app/src/views/screens/welcome.dart';
import 'package:travel_app/src/views/screens/view_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouting {
  static final GoRouter router = GoRouter(
      initialLocation: "/",
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: ViewScreen());
      },
      routes: [
        GoRoute(
            path: Routepath.homeScreen,
            builder: (context, state) {
              return const HomeScreen();
            }),
        GoRoute(
            path: Routepath.bottomBar,
            builder: (context, state) {
              return const BottomNavbar();
            }),
             GoRoute(
            path: Routepath.viewScreen,
            builder: (context, state) {
              return const ViewScreen();
            }),
      ]);
}
