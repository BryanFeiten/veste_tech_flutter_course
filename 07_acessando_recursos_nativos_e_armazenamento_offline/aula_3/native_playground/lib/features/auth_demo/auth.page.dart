import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:native_playground/features/auth_demo/adapter/auth.adapter.dart';
import 'package:native_playground/features/auth_demo/auth.store.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final store = AuthStore(LocalAuthAdapter());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Página de biometria'), centerTitle: true),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Center(child: Text('Biometria')),
            SizedBox(height: 40),
            Observer(
              builder: (_) {
                if (store.isCheckingAuth) {
                  return CircularProgressIndicator();
                }

                return Center(
                  child: Column(
                    children: [
                      if (store.isUserAuthenticated) ...[
                        Text('Usuário está autenticado'),
                        SizedBox(height: 10),
                      ],
                      FilledButton(
                        onPressed: store.tryAuthenticate,
                        child: Text('Chamar adapter'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
