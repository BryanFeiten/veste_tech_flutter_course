import 'package:flutter/material.dart';

import 'injection_container.dart';
import 'pages/home.page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initTasksDependencies();
  await initSqfliteDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Database Examples',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
