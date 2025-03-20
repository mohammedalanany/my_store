import 'package:flutter/material.dart';
import 'package:mystore/core/core/depindance_injection/locator.dart';
import 'package:mystore/my_app.dart';

import 'config/theme/loading_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupServices();
  configLoading();
  runApp(MyApp());
}
