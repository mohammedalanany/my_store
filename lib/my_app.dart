import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mystore/providers.dart';
import 'package:provider/provider.dart';

import 'config/localization/language_localization.dart';
import 'config/routes/routes.dart';
import 'config/theme/app_themes.dart';
import 'features/store_main/presentation/screens/screens/store_home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: AppProviders.getProviders(),
        child: MaterialApp(
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: localizationDelegates,
            supportedLocales: [Locale('en', ''), Locale('ar', '')],
            locale: Locale('en', ''),
            title: 'My store',
            color: Colors.white,
            theme: theme(context, 'en'),
            home: StoreHomeScreen(),
            routes: AppRoutes.routes));
  }
}
