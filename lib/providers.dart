import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


import 'core/core/depindance_injection/locator_service.dart';
import 'features/store_main/data/datasources/store_main_remote_data_source.dart';
import 'features/store_main/data/repositories/main_store_repository_impl.dart';
import 'features/store_main/presentation/screens/store_provider/store_main.dart';


class AppProviders {
  static final storeRepository =
      MainStoreRepositoryImpl(remoteDataSource: MainStoreRemoteDataSource());
  static List<SingleChildWidget> getProviders() {
    return [
      ChangeNotifierProvider<StoreMainProvider>(
          create: (_) => LocatorService.storeMainProvider),
    ];
  }
}
