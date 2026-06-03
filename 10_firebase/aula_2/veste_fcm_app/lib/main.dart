import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:veste_fcm_app/firebase_options.dart';
import 'package:veste_fcm_app/notifications_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Inicializa o adapter de notificações
  final notificationsAdapter = NotificationsAdapter();
  await notificationsAdapter.initialize();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationsAdapter().getToken().then((t) => print(t));

    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
