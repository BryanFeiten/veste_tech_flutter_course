import 'package:first_app/pages/widgets/botao_social_widget.dart';
import 'package:first_app/pages/widgets/clickable_text_span_widget.dart';
import 'package:first_app/pages/widgets/h1_widget.dart';
import 'package:flutter/material.dart';

class TwitterPage extends StatelessWidget {
  const TwitterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          // padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          // padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          // padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/twitter.png', width: 30, height: 30),
              H1('Veja o que está acontecendo agora no mundo.', align: .center),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // OutlinedButton componentizado
                  BotaoSocial.image(
                    'Login com Google',
                    imagePath: 'assets/google.png',
                  ),

                  // OutlinedButton componentizado
                  BotaoSocial.image(
                    'Login com Apple',
                    imagePath: 'assets/apple_full.png',
                  ),
                  SizedBox(height: 8),
                  DividerWithMiddleText('ou'),
                  FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.black87,
                    ),
                    child: Text('Criar conta'),
                  ),
                  SizedBox(height: 18),
                  Align(
                    alignment: .centerLeft,
                    child: Text.rich(
                      TextSpan(
                        text:
                            'Fazendo o login, você está de acordo com nossos ',
                        children: [
                          ClickableTextSpan(
                            'Termos de Uso',
                            onTap: () => print('Navegando para: Termos de Uso'),
                          ),
                          TextSpan(text: ', '),
                          ClickableTextSpan(
                            'Política de Privacidade',
                            onTap: () => print(
                              'Navegando para: Política de Privacidade',
                            ),
                          ),
                          TextSpan(text: ', e '),
                          ClickableTextSpan(
                            'Uso de Cookies',
                            onTap: () =>
                                print('Navegando para: Uso de Cookies'),
                          ),
                          TextSpan(text: '.'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Align(
                    alignment: .centerLeft,
                    child: Text.rich(
                      TextSpan(
                        text: 'Você já possui uma conta? ',
                        children: [
                          ClickableTextSpan(
                            'Faça o Login',
                            onTap: () => print('Navegando para o Login'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DividerWithMiddleText extends StatelessWidget {
  final String text;

  const DividerWithMiddleText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      spacing: 20,
      children: [
        Expanded(
          child: Divider(thickness: 0.8, color: const Color(0xFF9E9E9E)),
        ),
        Text(text),
        Expanded(child: Divider(thickness: 0.8, color: Colors.grey)),
      ],
    );
  }
}
