import 'package:mystore/core/core/depindance_injection/locator.dart';

import '../../../features/auth/screens/cubit/auth_cubit.dart';
import '../../../features/store_main/presentation/screens/store_provider/store_main.dart';

abstract class LocatorService {
  static StoreMainProvider get storeMainProvider =>
      locator<StoreMainProvider>();

  static AuthCubit get authCubit => locator<AuthCubit>();
}
