import 'package:mystore/core/core/depindance_injection/locator.dart';

import '../../../features/auth/screens/cubit/auth_cubit.dart';
import '../../../features/store_main/presentation/screens/cubit/product_details_cubit.dart';
import '../../../features/store_main/presentation/screens/cubit/recommend_product_cubit.dart';
import '../../../features/store_main/presentation/screens/cubit/store_main_cubit.dart';
import '../../../features/store_main/presentation/screens/store_provider/store_main.dart';
import '../services/navigation_service.dart';

abstract class LocatorService {
  static StoreMainProvider get storeMainProvider =>
      locator<StoreMainProvider>();
  static NavigationService get navigationService =>
      locator<NavigationService>();
  static AuthCubit get authCubit => locator<AuthCubit>();
  static StoreMainCubit get storeMainCubit =>
      locator<StoreMainCubit>()..fetchMainStoreData();
  static RecommendsProductsCubit get recommendsProductsCubit =>
      locator<RecommendsProductsCubit>()..fetchRecommendedProducts();

  static ProductDetailsCubit get productDetailsCubit =>
      locator<ProductDetailsCubit>()..fetchProductDetails();
}
