import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'notification_widget.dart';

class NotificationListWidget extends StatelessWidget {
  final List<RemoteMessage> notifications;
  final void Function(int index)? onNotificationTap;
  final void Function(int index)? onDismiss;

  const NotificationListWidget({
    super.key,
    required this.notifications,
    this.onNotificationTap,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    if (notifications.isEmpty) {
      return const _EmptyState();
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: notifications.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final notification = notifications[index];

        Widget notificationItem = NotificationWidget(
          title: notification.notification?.title ?? 'Sem título',
          body: notification.notification?.body ?? 'Sem conteúdo',
          imageUrl: notification.notification?.android?.imageUrl,
          data: notification.data,
          onTap: onNotificationTap != null ? () => onNotificationTap!(index) : null,
        );

        if (onDismiss != null) {
          return Dismissible(
            key: Key(notification.messageId ?? '$index'),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (_) => onDismiss!(index),
            child: notificationItem,
          );
        }

        return notificationItem;
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: 64,
            color: Theme.of(context).disabledColor,
          ),
          const SizedBox(height: 16),
          const Text(
            'Nenhuma notificação recebida',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'As notificações aparecerão aqui quando forem recebidas',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}