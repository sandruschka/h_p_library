import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:h_p_library/di/global_providers.dart';
import 'package:h_p_library/main_app.dart';
import 'package:h_p_library/models/cart_model.dart';
import 'package:h_p_library/styles/custom_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('fr')],
      fallbackLocale: const Locale('fr'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Henri Potier books',
        theme: CustomTheme.themeData(context),
        home: const MainApp(),
      ),
    );
  }
}
