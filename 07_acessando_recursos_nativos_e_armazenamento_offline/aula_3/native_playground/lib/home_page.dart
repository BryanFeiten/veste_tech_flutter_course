import 'package:flutter/material.dart';
import 'package:native_playground/features/camera_demo/camera.page.dart';
import 'package:native_playground/features/haptic_demo/haptic.page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native Playground'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _FeatureTile(
            title: 'Câmera Demo',
            subtitle: 'Teste de captura de imagem e vídeo',
            icon: Icons.camera_alt,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CameraPage()),
            ),
          ),
          const SizedBox(height: 16),
          _FeatureTile(
            title: 'Feedback Tátil Semântico',
            subtitle: 'Teste de vibrações baseadas em UX',
            icon: Icons.vibration,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HapticPage()),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _FeatureTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(icon),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
