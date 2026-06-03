// notification_adapter.dart
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationAdapter {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _fln =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    // 1. O Ícone do Android (Exigência do FLN)
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );

    // 2. Inicializa o Pintor (FLN)
    await _fln.initialize(initSettings);

    // 3. Pede permissão (Vital para iOS e Android 13+)
    await _fcm.requestPermission();

    // 4. Escuta App Aberto (Foreground)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Como o app está aberto, o SO ignorou. Temos que forçar o FLN a pintar.
      _showLocalNotification(message);
    });

    // 5. Escuta clique com App em Background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleNotificationClick(message.data);
    });
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    // Verifica se tem algo para mostrar antes de chamar o pintor
    if (message.notification == null) return;

    const androidDetails = AndroidNotificationDetails(
      'canal_principal_id', // ID do canal (Obrigatório no Android 8+)
      'Canal Principal',
      importance: Importance.max,
      priority: Priority.high,
    );
    const platformDetails = NotificationDetails(android: androidDetails);

    await _fln.show(
      message.hashCode,
      message.notification!.title,
      message.notification!.body,
      platformDetails,
    );
  }

  void _handleNotificationClick(Map<String, dynamic> data) {
    // Aqui vai a lógica de roteamento ou extração segura do payload
    print("Navegando para: ${data['rota']}");
  }
}

// 6. O Tratamento de App Fechado (Data Message) - Top Level Function
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Esse código roda isolado! Você precisaria instanciar o FLN aqui de novo
  // se quisesse desenhar uma notificação de dados com o app morto.
  print("Recebido em background: ${message.messageId}");
}
