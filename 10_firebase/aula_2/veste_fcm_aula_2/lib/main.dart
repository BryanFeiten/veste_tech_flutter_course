import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:veste_fcm_aula_2/firebase_options.dart';
import 'package:veste_fcm_aula_2/widgets/notification_widget.dart';
import 'package:veste_fcm_aula_2/widgets/notifications_screen.widget.dart';
import 'package:veste_fcm_aula_2/widgets/notification_type_demo.widget.dart';
import 'package:veste_fcm_aula_2/widgets/notification_stats.widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final navigatorKey = GlobalKey<NavigatorState>();
  final List<RemoteMessage> _receivedNotifications = [];
  final Map<String, int> _categoryCount = {};

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() async {
      await initializeFirebaseMessaging();
      await initializeFlutterLocalNotifications();
    });
  }

  Future<void> initializeFirebaseMessaging() async {
    final instance = FirebaseMessaging.instance;

    final settings = await instance.requestPermission();
    print(settings);

    instance.onTokenRefresh.listen(_sendToBackend);

    final token = await instance.getToken();
    print(token);

    if (token != null) _sendToBackend(token);

    FirebaseMessaging.onMessage.listen(_handleMessageFromFirebase);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageFromFirebase);
  }

  void _handleMessageFromFirebase(RemoteMessage event) {
    log(event.data.toString(), name: 'MSG Data');
    log(event.notification?.title ?? 'Sem Título', name: 'Title');
    log(event.notification?.body ?? 'Sem Body', name: 'Body');
    log(event.notification?.android?.imageUrl ?? 'Sem Imagem', name: 'Imagem');

    // Adicionar notificação à lista
    setState(() {
      _receivedNotifications.add(event);

      // Atualizar contagem por categoria
      final category = event.data['category'] as String? ?? 'Geral';
      _categoryCount[category] = (_categoryCount[category] ?? 0) + 1;
    });

    if (event.data case {'navigateTo': String route}) {
      // navigatorKey.currentState?.pushNamed(route);
    }
  }

  Future<void> initializeFlutterLocalNotifications() async {
    final localNotifications = FlutterLocalNotificationsPlugin();

    // Criar canal de notificação para Android
    const androidChannel = AndroidNotificationChannel(
      'default_channel_id',
      'Avisos Gerais',
      description: 'Canal para teste de notificações em foreground',
      importance: Importance.max,
    );

    // Criar o canal no Android
    await localNotifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);

    final localNotificationsSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );

    await localNotifications.initialize(
      settings: localNotificationsSettings,
      onSelectNotification: _onSelectNotification,
    );

    FirebaseMessaging.onMessage.listen(_handleFirebaseMessageOnForeground);
    // FirebaseMessaging.onBackgroundMessage(handler)
  }

  void _handleFirebaseMessageOnForeground(RemoteMessage message) {
    showNotification(message);
    _handleMessageFromFirebase(message);
  }

  Future<void> showNotification(RemoteMessage message) async {
    final androidNotificationDetails = AndroidNotificationDetails(
      'default_channel_id',
      'Avisos Gerais',
      channelDescription: 'Canal para teste de notificações em foreground',
      priority: Priority.high,
      importance: Importance.max,
      styleInformation: const BigTextStyleInformation(''),
    );

    final notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await FlutterLocalNotificationsPlugin().show(
      id: message.hashCode,
      title: message.notification?.title,
      body: message.notification?.body,
      payload: jsonEncode(message.data),
      notificationDetails: notificationDetails,
    );
  }

  Future<void> _onSelectNotification(String? payload) async {
    if (payload != null) {
      try {
        final data = jsonDecode(payload);
        log('Notificação selecionada com payload: $data', name: 'Notification Tap');
      } catch (e) {
        log('Erro ao decodificar payload: $e', name: 'Notification Tap Error');
      }
    }
  }

  // Função fictícia simulando requisição para o backend
  Future<void> _sendToBackend(String token) async {
    print('Enviando token para o backend: $token');
    await Future.delayed(const Duration(seconds: 1));
  }

  void _navigateToNotificationsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationsScreen(notifications: _receivedNotifications),
      ),
    );
  }

  void _simulateSimpleNotification() {
    final message = RemoteMessage(
      notification: const NotificationMessage(
        title: 'Notificação Simples',
        body: 'Esta é uma notificação simples de teste.',
      ),
      data: const {},
    );

    _handleMessageFromFirebase(message);
  }

  void _simulateDataNotification() {
    final now = DateTime.now();
    final message = RemoteMessage(
      notification: const NotificationMessage(
        title: 'Notificação com Dados',
        body: 'Esta notificação contém dados adicionais.',
      ),
      data: {
        'category': 'Promoção',
        'timestamp': now.toIso8601String(),
        'extra_data': 'Informações extras',
      },
    );

    _handleMessageFromFirebase(message);
  }

  void _simulateImageNotification() {
    final message = RemoteMessage(
      notification: const NotificationMessage(
        title: 'Notificação com Imagem',
        body: 'Esta notificação tem uma imagem.',
        android: AndroidNotificationMessage(
          imageUrl: 'https://via.placeholder.com/300x200/FF0000/FFFFFF?text=Imagem',
        ),
      ),
      data: const {
        'category': 'Destaque',
      },
    );

    _handleMessageFromFirebase(message);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FCM Demo'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Badge.count(
                count: _receivedNotifications.length,
                child: const Icon(Icons.notifications),
              ),
              onPressed: _navigateToNotificationsScreen,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Text(
                'Notificações Firebase',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              NotificationStatsWidget(
                totalReceived: _receivedNotifications.length,
                unreadCount: _receivedNotifications.length,
                categoryCount: _categoryCount,
              ),
              NotificationTypeDemo(
                onSimpleNotification: _simulateSimpleNotification,
                onDataNotification: _simulateDataNotification,
                onImageNotification: _simulateImageNotification,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    FilledButton(
                      onPressed: _getToken,
                      child: const Text('Obter Token FCM'),
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: _navigateToNotificationsScreen,
                      child: const Text('Ver Todas Notificações'),
                    ),
                  ],
                ),
              ),
              if (_receivedNotifications.isNotEmpty) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Última notificação recebida:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                NotificationWidget(
                  title: _receivedNotifications.last.notification?.title ?? 'Sem título',
                  body: _receivedNotifications.last.notification?.body ?? 'Sem conteúdo',
                  imageUrl: _receivedNotifications.last.notification?.android?.imageUrl,
                  data: _receivedNotifications.last.data,
                ),
              ],
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _getToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Token: $token')),
      );
      _sendToBackend(token);
    }
  }

  void initializeListeners() async {}
}
