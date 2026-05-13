import 'package:flutter/material.dart';
import 'package:veste_maps_app/core/injection_container.dart';
import 'package:veste_maps_app/pages/veste_outlets.page.dart';

void main() {
  registerDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: VesteOutletsPage());
  }
}
