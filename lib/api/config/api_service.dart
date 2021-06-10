import 'dart:async';
import 'package:code_magic_ex/api/api_address.dart';
import 'package:code_magic_ex/api/request/request_calculate_order.dart';
import 'package:code_magic_ex/api/request/request_place_order.dart';
import 'package:code_magic_ex/models/find_customer.dart';
import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/models/inventory_movement_records.dart';
import 'package:code_magic_ex/models/managed_warehouse.dart';
import 'package:code_magic_ex/models/order_list_rmas.dart';
import 'package:code_magic_ex/models/search_customer.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:code_magic_ex/api/request/request_customer_token.dart';
import 'package:code_magic_ex/models/user_info.dart';
import 'package:code_magic_ex/models/user_token.dart';


part 'api_service.g.dart';

@RestApi(baseUrl: Address.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  static ApiService _instance = ApiService(Dio());
  // static String proxy = Platform.isAndroid ? '<YOUR_LOCAL_IP>:8888' : 'localhost:8888';

  static ApiService init() {
    final Dio dio = Dio();
    // Tap into the onHttpClientCreate callback
    // to configure the proxy just as we did earlier.
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) { 
    //   // Hook into the findProxy callback to set the client's proxy.
    //   client.findProxy = (url) {
    //     return 'PROXY $proxy';
    //   };
    //   // This is a workaround to allow Charles to receive
    //   // SSL payloads when your app is running on Android.
    //   client.badCertificateCallback = (X509Certificate cert, String host, int port) => Platform.isAndroid;
    // };
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
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) { 
    //   // Hook into the findProxy callback to set the client's proxy.
    //   client.findProxy = (url) {
    //     return 'PROXY $proxy';
    //   };
    //     // This is a workaround to allow Charles to receive
    //   // SSL payloads when your app is running on Android.
    //   client.badCertificateCallback = (X509Certificate cert, String host, int port) => Platform.isAndroid;
    // };
    // dio.interceptors.add(
    //     InterceptorsWrapper(onRequest: (request, requestInterceptorHandler) {
    //   return;
    // }));
    dio.options.headers['authorization'] = "Bearer 60d09e95-eeb5-4d05-8210-2b39149a59bc";
    // dio.options.headers['authorization'] = "Bearer ${UserSessionManager.shared.customerToken.token}";
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    _instance = ApiService(dio);

    return _instance;
  }

  //Common apis

  @POST(Address.loginTokens)
  Future<CustomerToken> getLoginTokens(
      @Body() RequestPostCustomerToken request);

  @GET(Address.customerData)
  Future<UserInfo> getCustomerData(@Path('id') String id);
  
  @GET(Address.managedWarehouse)
  Future<ManagedWarehouses> getManagedWarehouses();
  
  @GET(Address.inventoryRecords)
  Future<InventoryRecords> getInventoryRecords(@Path('id') String id, @Query("expand") String expand);
  
  @GET(Address.inventoryMovementRecords)
  Future<List<InventoryMovementRecords>> getInventoryMovementRecords(@Path('id') String id, @Query("dateMoved") String dateMoved, @Query("expand") String expand);
  
  @GET(Address.ordersAndRmas)
  Future<OrdersAndRmas> getOrdersAndRmas(@Path('id') String id, @Query("dateCreated") String dateCreated, @Query("expand") String expand);
  
  @GET(Address.customers)
  Future<FindCustomer> findCustomer(@Query("unicity") int id, @Query("expand") String expand);
    
  @GET(Address.customers)
  Future<SearchCustomer> searchCustomer(@Query('fulltext') String searchKey, @Query('sponsor.id.unicity') int userId);
  
  @POST(Address.orderTerms)
  Future<CustomerToken> getOrderTerms(@Body() RequestPostCaclulateOrder request);

  @GET(Address.orders)
  Future<UserInfo> getPlaceOrders(@Body() RequestPostPlaceOrder request);
  
}
