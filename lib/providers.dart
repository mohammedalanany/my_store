import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

import 'core/core/depindance_injection/locator.dart';
import 'features/store_main/presentation/screens/cubit/store_main_cubit.dart';

class AppProviders {
  static List<SingleChildWidget> getProviders() {
    return [
      BlocProvider(
        create: (context) => locator<StoreMainCubit>()..fetchMainStoreData(),
      ),
      // Add other cubits if needed
    ];
  }
}
