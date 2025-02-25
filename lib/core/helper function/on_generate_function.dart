import 'package:flutter/material.dart';
import 'package:qube_cashier/Features/Main/presentation/views/main_layout.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case MainLayout.routeName:
      return MaterialPageRoute(builder: (context) => const MainLayout());

    default:
      return MaterialPageRoute(builder: (context) => const MainLayout());
  }
}
