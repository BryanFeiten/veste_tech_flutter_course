// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';

class ApiAdapter implements IHttpClientAdapter {
  final Dio _client;

  const ApiAdapter(this._client);

  @override
  Future<HttpResult> delete(String path, {Map<String, dynamic>? data}) async {
    final result = await _client.delete(path, data: data);

    final rawData = result.data;
    final rawStatus = result.statusCode;

    final finalData = rawData is String ? jsonDecode(rawData) : rawData;

    return HttpResult(data: finalData, statusCode: rawStatus ?? 0);
  }

  @override
  Future<HttpResult> get(String path) async {
    final result = await _client.get(path);

    dynamic rawData = result.data;
    final rawStatus = result.statusCode;

    try {
      rawData = jsonDecode(rawData);
    } catch (e) {
      // print(e);
      rawData = {'result': rawData};
    }

    return HttpResult(data: rawData, statusCode: rawStatus ?? 0);
  }

  @override
  Future<HttpResult> post(
    String path, {
    required Map<String, dynamic> data,
  }) async {
    final result = await _client.post(path, data: data);

    dynamic rawData = result.data;
    final rawStatus = result.statusCode;

    try {
      rawData = jsonDecode(rawData);
    } catch (e) {
      // print(e);
      rawData = {'result': rawData};
    }

    return HttpResult(data: rawData, statusCode: rawStatus ?? 0);
  }

  @override
  Future<HttpResult> put(
    String path, {
    required Map<String, dynamic> data,
  }) async {
    final result = await _client.put(path, data: data);

    dynamic rawData = result.data;
    final rawStatus = result.statusCode;

    try {
      rawData = jsonDecode(rawData);
    } catch (e) {
      // print(e);
      rawData = {'result': rawData};
    }

    return HttpResult(data: rawData, statusCode: rawStatus ?? 0);
  }
}

abstract class IHttpClientAdapter {
  Future<HttpResult> get(String path);
  Future<HttpResult> post(String path, {required Map<String, dynamic> data});
  Future<HttpResult> put(String path, {required Map<String, dynamic> data});
  Future<HttpResult> delete(String path, {Map<String, dynamic> data});
}

class HttpResult {
  final dynamic data;
  final int statusCode;

  const HttpResult({required this.data, required this.statusCode});

  @override
  String toString() => 'HttpResult(data: $data, statusCode: $statusCode)';
}
