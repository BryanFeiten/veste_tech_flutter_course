import 'dart:convert';

import 'package:dio/dio.dart';

class RegisterAccountService {
  final Dio _dio;

  const RegisterAccountService(this._dio);

  Future<Account?> call(AccountDto dto) async {
    final result = await _dio.post('/users');

    // Verificar se teve sucesso
    // result.statusCode == 200, 201

    if (result.statusCode != 200 && result.statusCode != 201) {
      return null;
    }

    // Transforma o dado "string" em Map<String, dynamic>
    final rawData = jsonDecode(result.data);

    final data = Account.fromMap(rawData);
    return data;
  }
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

void main() async {
  final dio = Dio();

  final service = RegisterAccountService(dio);
  final dto = AccountDto(name: 'name', email: 'email', password: 'password');

  await service(dto);
}
