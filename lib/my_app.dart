import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mystore/providers.dart';

import 'config/localization/language_localization.dart';
import 'config/routes/routes.dart';
import 'config/theme/app_themes.dart';
import 'core/core/depindance_injection/locator_service.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
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
          initialRoute: AppRoutes.initialRoute,
          navigatorKey: LocatorService.navigationService.navigatorKey,
          routes: AppRoutes.routes),
    );
  }
}
