import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'interceptors.dart';

enum HttpMethode { get, post, put, patch, delete }

class DioService {
  final Dio _dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: "https://jsonplaceholder.typicode.com",
      connectTimeout: const Duration(minutes: 3),
      receiveTimeout: const Duration(minutes: 3),
      // validateStatus: (statusCose) => true,
      // followRedirects: false,
    ),
  )..interceptors.add(AppInterceptors());

  Future request(
    HttpMethode method,
    String path, {
    dynamic data,
    headers,
    CancelToken? cancelToken,
    extra,
    queryParameters,
    bool forceRefresh = true,
  }) async {
    Response result;
    try {
      final queryParameters = <String, dynamic>{};
      
      result = await _dio.request(
        path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: Options(
          method: method.toString().split('.').last,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          // extra: extra,
          // validateStatus: (statusCode) {
          //   return true;
          // },
        ),
        data: data,
      );
      
      
      return jsonEncode(result.data);
    } on Exception catch (ex) {
      log("EXCEPTION ::: occured $ex");
    }
  }
}
