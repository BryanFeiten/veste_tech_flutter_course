import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gerenciamento_de_estado/stores/login.store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final store = LoginStore();

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: .all(24),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              TextFormField(
                decoration: InputDecoration(label: Text('E-mail')),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: _validateEmail,
                onChanged: store.writeEmail,
              ),
              const SizedBox(height: 12),
              ListenableBuilder(
                listenable: store,
                builder: (context, child) {
                  log('Rebuildado', name: 'Senha');

                  return TextFormField(
                    obscureText: store.hidePassword,
                    onChanged: store.writePassword,
                    decoration: InputDecoration(
                      label: Text('Senha'),
                      suffixIcon: InkWell(
                        onTap: store.toggleHidPassword,
                        child: store.hidePassword
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 36),
              ListenableBuilder(
                listenable: store,
                builder: (ctx, child) {
                  log('Rebuildado', name: 'ListenableBuilder.Botao');

                  if (store.isLoading) {
                    return CircularProgressIndicator();
                  }

                  return FilledButton(
                    onPressed: store.canLogin ? doLogin : null,
                    child: Text('Logar'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _validateEmail(String? value) {
    value ??= '';
    value = value.trim();

    if (value.length < 6) {
      return 'E-mail precisa ter mais de 6 caracteres';
    }

    if (!value.contains('@') || !value.contains('.com')) {
      return 'E-mail inválido';
    }

    return null;
  }

  void doLogin() async {
    final hasSuccess = await store.doLogin();
    if (!hasSuccess) return;

    if (!mounted) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Logado com ${store.email}')),
          body: Scaffold(
            body: Center(
              child: Column(
                children: [
                  Text('Usuário logado'),
                  FilledButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Deslogar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
