import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

import 'core/core/depindance_injection/locator.dart';
import 'features/auth/screens/cubit/auth_cubit.dart';

class AppProviders {
  static List<SingleChildWidget> getProviders() {
    return [
      BlocProvider(
        create: (context) => locator<AuthCubit>(),
      ),
      // Add other cubits if needed
    ];
  }
}
