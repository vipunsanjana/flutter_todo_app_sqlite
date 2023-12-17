import 'package:flutter/material.dart';
import 'package:todoapp/config/routes/routes.dart';
import 'package:todoapp/screens/screens.dart';
// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';

final navigationKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: (BuildContext context, GoRouterState state) {
      return const HomeScreen();
    },
  ),
  GoRoute(
    path: RouteLocation.createTask,
    parentNavigatorKey: navigationKey,
    //builder: CreateTask.builder,
    builder: (BuildContext context, GoRouterState state) {
      return const CreateTask();
    },
  )
];
