import 'dart:async';
import 'package:code_magic_ex/models/order_lines.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:code_magic_ex/api/api_address.dart';
import 'package:code_magic_ex/api/request/request_calculate_order.dart';
import 'package:code_magic_ex/api/request/request_place_order.dart';
import 'package:code_magic_ex/models/find_customer.dart';
import 'package:code_magic_ex/models/inventory_records.dart';
import 'package:code_magic_ex/models/inventory_movement_records.dart';
import 'package:code_magic_ex/models/managed_warehouse.dart';
import 'package:code_magic_ex/models/order_list_rmas.dart';
import 'package:code_magic_ex/models/search_customer.dart';

import 'package:code_magic_ex/api/request/request_customer_token.dart';
import 'package:code_magic_ex/models/user_info.dart';
import 'package:code_magic_ex/models/user_token.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Address.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  static ApiService _instance = ApiService(Dio());

  static ApiService init() {
    final Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    _instance = ApiService(dio);

    return _instance;
  }

  static ApiService shared() {
    final Dio dio = Dio();
    dio.options.headers['authorization'] = "Bearer ${UserSessionManager.shared.customerToken.token}";
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    _instance = ApiService(dio);

    return _instance;
  }

  static ApiService clientNoLogger() {
    final Dio dio = Dio();
    dio.options.headers['authorization'] = "Bearer ${UserSessionManager.shared.customerToken.token}";
    _instance = ApiService(dio);

    return _instance;
  }

  //? Example: https://hydra.unicity.net/v5a/loginTokens
  //? body
  //? {"type": "base64", "value": "Mjk3MDQ2NjoxMjM0", "namespace": "https://hydra.unicity.net/v5a/customers"}
  @POST(Address.loginTokens)
  Future<CustomerToken> getLoginTokens(
      @Body() RequestPostCustomerToken request);

  //? Example: https://hydra.unicity.net/v5a/customers/3d9104cc2fa45dbd0bdd1a4261f6969e
  @GET(Address.customerData)
  Future<UserInfo> getCustomerData(@Path('id') String id);
  
  //? Example: https://hydra.unicity.net/v5a/customers/me/managedwarehouses
  @GET(Address.managedWarehouse)
  Future<ManagedWarehouses> getManagedWarehouses();
  
  //? Example: https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/inventoryRecords?expand=item
  @GET(Address.inventoryRecords)
  Future<InventoryRecords> getInventoryRecords(@Path('id') String id, @Query("expand") String expand);
  
  //? Example: https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/inventoryMovementRecords?dateMoved=[2019-01-01;2021-06-01]&expand=catalogSlide,terms
  @GET(Address.inventoryMovementRecords)
  Future<List<InventoryMovementRecords>> getInventoryMovementRecords(@Path('id') String id, @Query("dateMoved") String dateMoved, @Query("expand") String expand);
  
  //? Example: https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/ordersAndRmas?dateCreated=[2019-01-01;2019-06-01]&expand=order,rma 
  @GET(Address.ordersAndRmas)
  Future<OrdersAndRmas> getOrdersAndRmas(@Path('id') String id, @Query("dateCreated") String dateCreated, @Query("expand") String expand);
  
  //? Example: https://hydra.unicity.net/v5a/customers?unicity=108357166&expand=customer
  @GET(Address.customers)
  Future<FindCustomer> findCustomer(@Query("unicity") int id, @Query("expand") String expand);
  
  //? Example: https://hydra.unicity.net/v5a/customers?fulltext=Test&sponsor.id.unicity=1
  @GET(Address.customers)
  Future<SearchCustomer> searchCustomer(@Query('fulltext') String searchKey, @Query('sponsor.id.unicity') int userId);
  
  @POST(Address.orderTerms)
  Future<CustomerToken> getOrderTerms(@Body() RequestPostCaclulateOrder request);

  //? Example: https://hydra.unicity.net/v5a/orderlines?order.customer.id.unicity=3011266&order.dateCreated=[2020-11;2021-06]&criteria=easyship&expand=catalogSlide,order,order.customer&order.market=TH
  @GET(Address.orderLines)
  Future<OrderLines> getOrderLines(@Query('order.customer.id.unicity') String userId, @Query('order.dateCreated') String dateCreated, @Query('criteria') String criteria, @Query('expand') String expand, @Query('order.market') String market);

  //? Example: https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/orders
  //? Body
  //? { "customer": { "href": "https://hydra.unicity.net/v5a/customers?unicity=108357166" }, "lines": { "items": [ { "item": { "href": "https://hydra.unicity.net/v5a/items?id.unicity=17532"}, "quantity": "1"}, {"item": {"href": "https://hydra.unicity.net/v5a/items?id.unicity=17532"},"quantity": "2"}]},
  //?  "shipToName": {"firstName": "First","lastName": "Last"},"shipToPhone": "555-555-5555","shipToEmail": "test@test.com","shipToAddress": {"city": "Bangkok","country": "TH","state": "","address1": "Rotenarmeestrasse 1", "zip": "90109"},
  //?  "shippingMethod": { "href": "https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/shippingmethods?type=WillCall"},
  //? "notes": "batch XXYY by First Last", "transactions": {"items": [{"amount": "this.terms.total","type": "record","method": "Cash"}]}}
  @POST(Address.orders)
  Future<UserInfo> getPlaceOrders(@Body() RequestPostPlaceOrder request);
}

@RestApi(baseUrl: Address.memberCalls2Base)
abstract class MemberCalls2Service {
  factory MemberCalls2Service(Dio dio, {String baseUrl}) = _MemberCalls2Service;

  static MemberCalls2Service init() {
    final Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    return MemberCalls2Service(dio);
  }

  //? Example: https://member-calls.unicity.com/ALL/DSC/getdata.php?type=barcode&datepicker1=2021-06-01&datepicker2=2021-06-18&token=85905f08-b320-4e20-a6d1-2d96ebec6481&lang=en&id=2970466&action=1
  @GET(Address.validOrders)
  Future<List<String>> getValidOrders(@Query('type') String type, @Query('datepicker1') String datepicker1, @Query('datepicker2') String datepicker2, @Query('token') String token, @Query('lang') String lang, @Query('id') String id, @Query('action') String action);
}

@RestApi(baseUrl: Address.memberCallsBase)
abstract class MemberCallsService {
  factory MemberCallsService(Dio dio, {String baseUrl}) = _MemberCallsService;

  static MemberCallsService init() {
    final Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    return MemberCallsService(dio);
  }

  //Common apis
  //? url=https://member-calls2.unicity.com/dictionary/publish?lang=TH%2CEN
  @GET(Address.dictionary)
  Future<CustomerToken> getTranslations(@Query("lang") String lang);
}

