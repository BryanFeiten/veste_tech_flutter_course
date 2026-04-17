import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'url_launcher.store.dart';

class UrlLauncherPage extends StatefulWidget {
  const UrlLauncherPage({super.key});

  @override
  State<UrlLauncherPage> createState() => _UrlLauncherPageState();
}

class _UrlLauncherPageState extends State<UrlLauncherPage> {
  final store = UrlLauncherStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Url Launcher Demo')),
      body: Observer(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'URL (ex: https://google.com)',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) => store.openUrl(value),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: store.isLoading
                        ? null
                        : () => store.openUrl('https://google.com'),
                    child: store.isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Abrir Google'),
                  ),
                  // const SizedBox(height: 20),
                  // ElevatedButton(
                  //   onPressed: store.isLoading
                  //       ? null
                  //       : () => store.openUrl('https://linked.in/bryanfeiten'),
                  //   child: store.isLoading
                  //       ? const CircularProgressIndicator()
                  //       : const Text('Abrir Linkedin'),
                  // ),
                  // const SizedBox(height: 20),
                  // ElevatedButton(
                  //   onPressed: store.isLoading
                  //       ? null
                  //       : () => store.openUrl('https://duolingo.com'),
                  //   child: store.isLoading
                  //       ? const CircularProgressIndicator()
                  //       : const Text('Abrir Duolingo'),
                  // ),
                  // const SizedBox(height: 20),
                  // ElevatedButton(
                  //   onPressed: store.isLoading
                  //       ? null
                  //       : () => store.openUrl('https://instagram.com'),
                  //   child: store.isLoading
                  //       ? const CircularProgressIndicator()
                  //       : const Text('Abrir Instagram'),
                  // ),
                  const Divider(height: 40),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Número WhatsApp (ex: 5551999999999)',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: store.writeNumber,
                    onSubmitted: (_) => store.openWhatsApp(),
                    keyboardType: .number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                  ),
                  const Divider(height: 20),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Texto para enviar',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                    minLines: 1,
                    onChanged: store.writeWhatsMessage,
                    onSubmitted: (_) => openWhats(),
                    keyboardType: .text,
                  ),
                  const SizedBox(height: 20),
                  Observer(
                    builder: (_) {
                      return ElevatedButton(
                        onPressed: store.canOpenWhats
                            ? store.openWhatsApp
                            : null,
                        child: store.isLoading
                            ? const CircularProgressIndicator()
                            : const Text('Abrir WhatsApp Exemplo'),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void openWhats() {
    store.openWhatsApp();
  }
}
