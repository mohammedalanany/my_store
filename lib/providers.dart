import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

import 'core/core/depindance_injection/locator.dart';
import 'features/auth/screens/cubit/auth_cubit.dart';
import 'features/store_main/presentation/screens/cubit/product_details_cubit.dart';
import 'features/store_main/presentation/screens/cubit/recommend_product_cubit.dart';
import 'features/store_main/presentation/screens/cubit/store_main_cubit.dart';

class AppProviders {
  static List<SingleChildWidget> getProviders() {
    return [
      BlocProvider(
        create: (context) => locator<AuthCubit>(),
      ),
      BlocProvider(create: (context) => locator<StoreMainCubit>()),
      BlocProvider(create: (context) => locator<RecommendsProductsCubit>()),
      BlocProvider(create: (context) => locator<ProductDetailsCubit>()),

      // Add other cubits if needed
    ];
  }
}
