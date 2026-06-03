import 'package:flutter/material.dart';

class NotificationStatsWidget extends StatelessWidget {
  final int totalReceived;
  final int unreadCount;
  final Map<String, int> categoryCount;

  const NotificationStatsWidget({
    super.key,
    required this.totalReceived,
    required this.unreadCount,
    required this.categoryCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Estatísticas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _StatCard(
                  title: 'Total',
                  value: totalReceived.toString(),
                  icon: Icons.notifications,
                  color: Colors.blue,
                ),
                const SizedBox(width: 16),
                _StatCard(
                  title: 'Não Lidas',
                  value: unreadCount.toString(),
                  icon: Icons.markunread,
                  color: Colors.orange,
                ),
              ],
            ),
            if (categoryCount.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Text(
                'Por Categoria:',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryCount.length,
                  itemBuilder: (context, index) {
                    final entry = categoryCount.entries.elementAt(index);
                    return Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            entry.key,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '(${entry.value})',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: color.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Icon(icon, color: color),
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}