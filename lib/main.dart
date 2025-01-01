import 'package:flutter/material.dart';
import 'package:journal_app/core/routes/on_generate_routes.dart';
import 'package:journal_app/core/services/injection_container.dart';
import 'package:journal_app/core/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal App',
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      onGenerateRoute: generateRoute,
    );
  }
}
