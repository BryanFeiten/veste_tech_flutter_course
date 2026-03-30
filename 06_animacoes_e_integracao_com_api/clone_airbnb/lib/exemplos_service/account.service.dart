import 'package:clone_airbnb/adapters/http_client.adapter.dart';
import 'package:dio/dio.dart';

class AccountService {
  final IHttpClientAdapter _dio;

  const AccountService(this._dio);

  Future<Account?> registerAccount(AccountDto dto) async {
    final result = await _dio.post('/users', data: {'nome': 'fulano de tal'});

    // Verificar se teve sucesso
    // result.statusCode == 200, 201

    if (result.statusCode != 200 && result.statusCode != 201) {
      return null;
    }

    return Account.fromMap(result.data);
  }

  Future<List<Account>> listAccounts() async {
    // ...
    return [];
  }

  Future<void> deleteAccount() async {
    // ...
  }
}

void main() async {
  final dio = Dio();

  final service = AccountService(ApiAdapter(dio));
  final dto = AccountDto(name: 'name', email: 'email', password: 'password');

  await service.registerAccount(dto);
}

class AccountDto {
  final String name;
  final String email;
  final String password;

  const AccountDto({
    required this.name,
    required this.email,
    required this.password,
  });
}

class Account {
  final String uid;
  final String name;
  final String email;
  final String password;

  const Account._({
    required this.uid,
    required this.name,
    required this.email,
    required this.password,
  });

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account._(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }
}
