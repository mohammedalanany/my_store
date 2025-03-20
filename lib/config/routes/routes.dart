import 'package:flutter/material.dart';

import '../../features/store_main/presentation/screens/screens/store_home_screen.dart';

class AppRoutes {
  static const initialRoute = StoreHomeScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    StoreHomeScreen.routeName: (_) => StoreHomeScreen(),
  };
}
