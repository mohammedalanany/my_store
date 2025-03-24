import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/features/auth/screens/screens/login_screen.dart';

import '../../core/core/depindance_injection/locator_service.dart';
import '../../features/store_main/presentation/screens/cubit/recommend_product_cubit.dart';
import '../../features/store_main/presentation/screens/cubit/store_main_cubit.dart';
import '../../features/store_main/presentation/screens/screens/home_screen_with_cubit.dart';
import '../../features/store_main/presentation/screens/screens/product_detail_screen.dart';
import '../../features/store_main/presentation/screens/screens/store_home_screen.dart';

class AppRoutes {
  static const initialRoute = LoginScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    StoreHomeScreen.routeName: (_) => StoreHomeScreen(),
    StoreHomeScreenWithCubit.routeName: (_) => MultiBlocProvider(providers: [
          BlocProvider<StoreMainCubit>(
            create: (context) => LocatorService.storeMainCubit,
          ),
          BlocProvider<RecommendsProductsCubit>(
            create: (context) => LocatorService.recommendsProductsCubit,
          ),
        ], child: StoreHomeScreenWithCubit()),
    LoginScreen.routeName: (_) => BlocProvider(
        create: (context) => LocatorService.authCubit, child: LoginScreen()),
    ProductDetailScreen.routeName: (_) => BlocProvider(
        create: (context) => LocatorService.productDetailsCubit,
        child: ProductDetailScreen()),
  };
}
