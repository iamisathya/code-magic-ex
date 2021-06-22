import 'dart:io';

import 'package:code_magic_ex/services/rest_api/exceptions.dart';
import 'package:code_magic_ex/utilities/connectivity.dart';
import 'package:code_magic_ex/utilities/core/parsing.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class RestApiNepBaseService {
  Dio dio = Dio();

  RestApiNepBaseService() {
    final BaseOptions options = BaseOptions(
      baseUrl: "https://hydra.unicity.net/v5a",

      ///production
      // baseUrl: "https://eduflip.herokuapp.com/",///develop
      connectTimeout: 30000,
      receiveTimeout: 30000,
    );

    dio = Dio(options);
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
  }

  /// Helper Method - [setToken]
  void setToken(String token) {
    if (token.isEmpty) return;

    /// Headers
    final Map<String, dynamic> headers = {
      'token': token,
      'Content-Type': "application/json"
    };

    /// Request Interceptors;
    dio.interceptors
        .add(InterceptorsWrapper(onError: (error, errorInterceptorHandler) {
      debugPrint(error.message);
    }, onRequest: (request, requestInterceptorHandler) {
      request.contentType = Headers.jsonContentType;
      if (headers.isNotEmpty) {
        headers.forEach((key, value) => request.headers[key] = value);
      }
      return;
    }, onResponse: (response, responseInterceptorHandler) {
      debugPrint(
          '${response.statusCode} ${response.statusCode} ${response.data}');
    }));
  }

  /// Helper Method - [_setProxy]
  /// It will set the proxy to the http methods
  /// If set, it can be tracked using charles
  void setProxy({required String ip, required String port}) {
    if (ip.isEmpty || port.isEmpty) return;

    // Dio
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (uri) => "PROXY $ip:$port";
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => Platform.isAndroid;
    };
  }

  /// Helper Method - [getException]
  /// Return our own [Exception] from the [DioErrorType]
  AppException getException(dynamic error) {
    debugPrint(error.toString());
    if (error == null || ((error is DioError) == false)) {
      return const GeneralException();
    }
    final dioError = error as DioError;
    switch (dioError.type) {
      case DioErrorType.response:
        final dynamic mapData =
            dioError.response!.data is Map ? dioError.response!.data : {};
        String message = Parsing.stringFrom(mapData['error']);
        if (message.isEmpty) {
          // Checking if the error comes in array of strings format
          final List<String> messages = Parsing.arrayFrom(mapData['error'])!
              .map((element) => Parsing.stringFrom(element))
              .where((element) => element.isNotEmpty)
              .toList();
          if (messages.isNotEmpty) message = messages.first;
        }
        if (message.isEmpty) message = Parsing.stringFrom(mapData['message']);
        if (message.isEmpty) message = dioError.response!.statusMessage!;
        // return ApiResponseException(
        //     errMessage: message, errStatus: dioError.response!.statusCode);
        return const ApiResponseException();
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        return const ApiTimedOutException();
      default:
        if (ConnectivityManager.shared.isNotAvailable()) {
          return const InternetConnectivityException();
        }
        // return GeneralException(errStatus: dioError.response!.statusCode);
        return const GeneralException();
    }
  }
}
