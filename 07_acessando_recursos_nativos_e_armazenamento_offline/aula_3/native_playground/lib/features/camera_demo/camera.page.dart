import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:native_playground/core/di/injection.dart';
import 'package:native_playground/features/camera_demo/camera.store.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final store = CameraStore(sl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Native Playground - Câmera')),
      body: Center(
        child: Observer(
          builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (store.isLoading)
                  const CircularProgressIndicator()
                else if (store.imageFile != null)
                  Column(
                    children: [
                      Image.file(
                        store.imageFile!,
                        height: 300,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: store.clearImage,
                        child: const Text('Limpar Imagem'),
                      ),
                    ],
                  )
                else
                  const Text('Nenhuma imagem selecionada'),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => store.pickImage(true),
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('Tirar Foto'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton.icon(
                      onPressed: () => store.pickImage(false),
                      icon: const Icon(Icons.photo_library),
                      label: const Text('Galeria'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
