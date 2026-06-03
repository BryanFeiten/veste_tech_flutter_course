import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Adapter responsável por gerenciar notificações via Firebase Cloud Messaging
/// e exibição de notificações locais focadas exclusivamente no ANDROID.
class NotificationsAdapter {
  NotificationsAdapter._internal();

  static final NotificationsAdapter _instance =
      NotificationsAdapter._internal();

  factory NotificationsAdapter() => _instance;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  late final FlutterLocalNotificationsPlugin _localNotificationsPlugin;

  /// Inicializa o serviço de notificações (Fluxo Principal)
  Future<void> initialize() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // 1. Configurações para notificações locais no Android (Ícone obrigatório)
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Inicializa o desenhista (Local Notifications)
    await _localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    // 2. Configuração dos gatilhos do Firebase (O Carteiro)
    await _configureFirebaseMessaging();
  }

  /// Configura os listeners do Firebase Messaging
  Future<void> _configureFirebaseMessaging() async {
    // Liga o radar para rotação de tokens (Evita perda de sincronia com backend)
    _firebaseMessaging.onTokenRefresh.listen((String newToken) {
      print('FCM Token atualizado (Rotação): $newToken');
      // TODO: Enviar esse novo token para o backend
    });

    // Manipula mensagens apenas com "data" quando o app está FECHADO/BACKGROUND
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Manipula mensagens quando o app está ABERTO na tela (Foreground)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleForegroundMessage(message);
    });

    // Manipula clique na notificação quando o app estava MINIMIZADO
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleMessageOpenedApp(message, 'Minimizado');
    });

    // Manipula clique na notificação quando o app estava TOTALMENTE FECHADO (Cold Boot)
    final RemoteMessage? initialMessage = await _firebaseMessaging
        .getInitialMessage();
    if (initialMessage != null) {
      _handleMessageOpenedApp(initialMessage, 'Totalmente Fechado');
    }
  }

  /// Manipula mensagens recebidas em segundo plano
  /// IMPORTANTE: Obrigatório o uso do pragma para não ser apagado no modo Release
  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    print('Mensagem recebida no Limbo (Background): ${message.messageId}');
    // ATENÇÃO: Nenhuma instância de classe (como injeção de dependência) funciona aqui.
    // Se quiser exibir notificação visual de dados aqui, precisará recriar o
    // FlutterLocalNotificationsPlugin do zero dentro deste método.
  }

  /// Manipula mensagens quando o app está em primeiro plano
  void _handleForegroundMessage(RemoteMessage message) {
    print('Mensagem recebida com App Aberto: ${message.messageId}');
    // O Android silencia notificações com o app aberto. Forçamos o desenho na tela.
    if (message.notification != null) {
      _showLocalNotification(message);
    }
  }

  /// Manipula mensagens quando o app é aberto a partir de um clique
  void _handleMessageOpenedApp(RemoteMessage message, String origin) {
    print(
      'App aberto via notificação (Origem: $origin). ID: ${message.messageId}',
    );

    // Aqui você pega o message.data e faz a navegação
    // Exemplo: rotas, recarregar listas, etc.
  }

  /// Exibe uma notificação local (Força o pop-up na tela)
  Future<void> _showLocalNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          'default_channel_id', // ID do canal (Mesmo que o backend deve mandar)
          'Avisos Gerais', // Nome visível para o usuário nas configs do Android
          channelDescription: 'Canal padrão para notificações do aplicativo',
          importance: Importance.max,
          priority: Priority.high,
        );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await _localNotificationsPlugin.show(
      message.hashCode, // ID único gerado a partir do hash da mensagem
      message.notification?.title ?? 'Novo Aviso',
      message.notification?.body ?? 'Você tem uma nova mensagem.',
      notificationDetails,
      // Correção crítica: transforma o map de dados num JSON válido
      payload: jsonEncode(message.data),
    );
  }

  /// Obtém o token do dispositivo atual para testes
  Future<String?> getToken() async {
    return await _firebaseMessaging.getToken();
  }

  /// Callback acionado quando o usuário CLICA em uma notificação desenhada localmente
  void onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) {
    final String? payloadStr = notificationResponse.payload;
    if (payloadStr != null && payloadStr.isNotEmpty) {
      print('Usuário clicou na notificação local. Payload: $payloadStr');

      try {
        // Agora você pode decodificar com segurança pois garantimos o jsonEncode
        final Map<String, dynamic> data = jsonDecode(payloadStr);
        print('Dados decodificados para navegação: $data');
      } catch (e) {
        print('Erro ao dar parse no payload: $e');
      }
    }
  }
}
