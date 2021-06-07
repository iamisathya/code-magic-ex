import 'dart:async';
import 'dart:io';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:code_magic_ex/api/request/request_customer_token.dart';
import 'package:code_magic_ex/models/user_info.dart';
import 'package:code_magic_ex/models/user_token.dart';


part 'api_service.g.dart';

@RestApi(baseUrl: 'https://hydra.unicity.net/v5a/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  static ApiService _instance = ApiService(Dio());
  static String proxy = Platform.isAndroid ? '<YOUR_LOCAL_IP>:8888' : 'localhost:8888';

  static ApiService init() {
    final Dio dio = Dio();
    // Tap into the onHttpClientCreate callback
    // to configure the proxy just as we did earlier.
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) { 
      // Hook into the findProxy callback to set the client's proxy.
      client.findProxy = (url) {
        return 'PROXY $proxy';
      };
      // This is a workaround to allow Charles to receive
      // SSL payloads when your app is running on Android.
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => Platform.isAndroid;
    };
    // dio.interceptors.add(
    //     InterceptorsWrapper(onRequest: (request, requestInterceptorHandler) {
    //   debugPrint("${request.method} | ${request.path}");
    //   return;
    // }));
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    _instance = ApiService(dio);

    return _instance;
  }

  static ApiService shared() {
    final Dio dio = Dio();
    // Tap into the onHttpClientCreate callback
    // to configure the proxy just as we did earlier.
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) { 
      // Hook into the findProxy callback to set the client's proxy.
      client.findProxy = (url) {
        return 'PROXY $proxy';
      };
        // This is a workaround to allow Charles to receive
      // SSL payloads when your app is running on Android.
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => Platform.isAndroid;
    };
    dio.options.headers['authorization'] = "Bearer 60d09e95-eeb5-4d05-8210-2b39149a59bc";
    dio.interceptors.add(
        InterceptorsWrapper(onRequest: (request, requestInterceptorHandler) {
      return;
    }));
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    _instance = ApiService(dio);

    return _instance;
  }

  //Common apis
  @GET('/customers/{id}')
  Future<UserInfo> getCustomerData(@Path('id') String id);

  @POST('/loginTokens')
  Future<CustomerToken> getLoginTokens(
      @Body() RequestPostCustomerToken request);
}
