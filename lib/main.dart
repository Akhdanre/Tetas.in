import 'package:flutter/material.dart';
import 'package:tetas_in/src/bussines_logic/realtime/background_service.dart';
import 'package:tetas_in/src/presentation/pages/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initSse();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tetas.In",
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('id'),
      theme:
          ThemeData(primaryColor: Colors.white, brightness: Brightness.light),
      home: const SplashScreenPage(),
    );
  }
}
