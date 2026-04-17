import 'dart:developer';

import 'package:url_launcher/url_launcher.dart' as url_launcher;

abstract class IOpenLinks {
  Future<bool> launchUrl(String urlString);
  Future<bool> launchWhatsApp(String phoneNumber, {String message = ''});
}

class UrlLauncherAdapter implements IOpenLinks {
  /// Abre uma URL genérica no navegador ou app correspondente
  @override
  Future<bool> launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);

    if (await url_launcher.canLaunchUrl(url)) {
      return await url_launcher.launchUrl(
        url,
        mode: url_launcher.LaunchMode.externalApplication,
      );
    }
    return false;
  }

  /// Abre chat do WhatsApp para um número específico
  @override
  Future<bool> launchWhatsApp(String phoneNumber, {String message = ''}) async {
    // // Formato: https://wa.me/numero
    // final String urlString =
    // 'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';
    // return await launchUrl(urlString);

    // whatsapp://?phone=5199999999?text=xyz
    final componentEncoded = Uri.encodeComponent(message);

    log(message, name: 'Mensagem');
    // Você está apresentando. Não compartilhe...
    log(componentEncoded, name: 'Mensagem (encodada)');
    // Voc%C3%AA%20est%C3%A1%20apresentando.%20N%C3%A3o%20compartilhe...

    // Exemplo de encode (url)
    // qualquer coisa
    // qualquer%20coisa

    return await url_launcher.launchUrl(
      Uri(
        scheme: 'whatsapp',
        host: 'send',
        queryParameters: {'phone': phoneNumber, 'text': message},
      ),
    );
  }
}
