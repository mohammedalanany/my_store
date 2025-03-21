import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mystore/features/auth/screens/screens/login_screen.dart';

import 'config/localization/language_localization.dart';
import 'config/routes/routes.dart';
import 'config/theme/app_themes.dart';
import 'core/core/depindance_injection/locator.dart';
import 'features/auth/screens/cubit/auth_cubit.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: localizationDelegates,
        supportedLocales: [Locale('en', ''), Locale('ar', '')],
        locale: Locale('en', ''),
        title: 'My store',
        color: Colors.white,
        theme: theme(context, 'en'),
        home: BlocProvider<AuthCubit>(
            create: (context) => locator<AuthCubit>(), child: LoginScreen()),
        routes: AppRoutes.routes);
  }
}
