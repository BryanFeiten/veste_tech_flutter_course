import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'notification_widget.dart';
import 'notification_list.widget.dart';

class NotificationsScreen extends StatefulWidget {
  final List<RemoteMessage> notifications;

  const NotificationsScreen({super.key, required this.notifications});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late List<RemoteMessage> _notifications;

  @override
  void initState() {
    super.initState();
    _notifications = List.from(widget.notifications);
  }

  void _removeNotification(int index) {
    setState(() {
      _notifications.removeAt(index);
    });
  }

  void _clearAllNotifications() {
    setState(() {
      _notifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificações'),
        centerTitle: true,
        actions: [
          if (_notifications.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear_all),
              onPressed: _clearAllNotifications,
            ),
        ],
      ),
      body: NotificationListWidget(
        notifications: _notifications,
        onNotificationTap: (index) {
          // Tratar clique na notificação
          if (index >= 0 && index < _notifications.length) {
            final notification = _notifications[index];
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Notificação clicada: ${notification.notification?.title ?? "Sem título"}'),
              ),
            );
          }
        },
        onDismiss: (index) {
          _removeNotification(index);
        },
      ),
    );
  }
}