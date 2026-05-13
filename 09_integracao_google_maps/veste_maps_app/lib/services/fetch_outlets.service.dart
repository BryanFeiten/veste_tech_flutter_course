// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:veste_maps_app/models/api_result.model.dart';
import 'package:veste_maps_app/models/failure.model.dart';
import 'package:veste_maps_app/models/outlet.model.dart';

class FetchOutletsService {
  final Dio _http;

  const FetchOutletsService(this._http);

  Future<ApiResult<List<Outlet>>> call() async {
    final response = await _http.get('/stores');
    if (response.statusCode != 200) {
      String? title;
      String? description;

      if (response.data case {
        'result': {
          'title': String apiTitle,
          'description': String apiDescription,
        },
      }) {
        title = apiTitle;
        description = apiDescription;
      }

      return ApiResult.failure(
        Failure(
          title: title ?? 'Erro ao listar lojas',
          description:
              description ??
              'Ocorreu um erro ao listar as lojas. Tente novamente!\nEm caso de persistência do erro, entre em contato com nosso suporte.',
          statusCode: response.statusCode ?? 0,
        ),
      );
    }

    final rawResult = response.data['result'] as List;
    final mappedResult = rawResult.map((e) => Outlet.fromMap(e)).toList();

    return ApiResult.success(mappedResult);
  }
}
