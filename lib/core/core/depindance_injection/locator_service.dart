import 'package:mystore/core/core/depindance_injection/locator.dart';

import '../../../features/store_main/presentation/screens/store_provider/store_main.dart';

abstract class LocatorService {
  static StoreMainProvider get storeMainProvider =>
      locator<StoreMainProvider>();
}
