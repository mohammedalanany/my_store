import 'package:flutter/material.dart';

import '../../features/store_main/presentation/screens/screens/home_screen_with_cubit.dart';
import '../../features/store_main/presentation/screens/screens/store_home_screen.dart';

class AppRoutes {
  static const initialRoute = StoreHomeScreenWithCubit.routeName;

  static final Map<String, WidgetBuilder> routes = {
    StoreHomeScreen.routeName: (_) => StoreHomeScreen(),
  };
}
