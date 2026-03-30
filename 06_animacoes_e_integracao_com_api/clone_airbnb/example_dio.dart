import 'package:clone_airbnb/config/service_locator.dart' as sl;
import 'package:dio/dio.dart';

// minha-api.com.br/api/users
// baseUrl: minha-api.com.br/api
// rota: /users

void main() async {
  sl.main();
  // final httpClient = HttpClient();
  final httpClient = Dio(
    BaseOptions(
      validateStatus: (_) => true,
      baseUrl: 'https://gist.githubusercontent.com/BryanFeiten',
    ),
  );

  final url =
      '/e73d99e6f0abdac870a3345be5221d19/raw/58539cb3c4fc8441ad4069456160ef518d36846d/products.json';
  // '/e73d99e6f0abdac870a3345be5221d19/raw/58539cb3c4fc8441ad4069456160ef518d36846d/outra-coisa.json';

  print('chamada dio');

  final result = await httpClient.get(url);

  print('teste');
  print(result);
}
// exemplo_dio