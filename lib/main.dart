import 'package:flutter/material.dart';
import 'package:flutter_core/routes.dart';
import 'package:flutter_core/screens/splash/splash_screen.dart';
import 'package:flutter_core/theme.dart';
import 'package:flutter_gen/gen_l10n/translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/l10n.dart';

void main() => {runApp(MyApp())};

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
			title: 'Flutter Demo',
			theme: theme(),
      supportedLocales: L10n.all, 
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialRoute: SplashScreen.routeName,
      routes: routes,
		);
  }
}
