import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/amphur_item.dart';
import '../../models/cash_coupon_response.dart';
import '../../models/district_item.dart';
import '../../models/easy_ship_reports.dart';
import '../../models/enroll_form.dart';
import '../../models/find_customer.dart';
import '../../models/general_models.dart';
import '../../models/govt_id_verify.dart';
import '../../models/guest_user_info.dart';
import '../../models/inventory_movement_records.dart';
import '../../models/inventory_records.dart';
import '../../models/managed_warehouse.dart';
import '../../models/open_order_id.dart';
import '../../models/open_po.dart';
import '../../models/open_po_create_order_response.dart';
import '../../models/open_po_details.dart';
import '../../models/order_calc_response.dart';
import '../../models/order_entry_product_item.dart';
import '../../models/order_lines.dart';
import '../../models/order_list_rmas.dart';
import '../../models/place_order.dart';
import '../../models/profile_picture.dart';
import '../../models/provience_item.dart';
import '../../models/sales_report_details.dart';
import '../../models/sales_report_item_item.dart';
import '../../models/sales_report_order_item.dart';
import '../../models/sales_report_rma_item.dart';
import '../../models/search_customer.dart';
import '../../models/search_reponse_by_href.dart';
import '../../models/user_id.dart';
import '../../models/user_info.dart';
import '../../models/user_token.dart';
import '../../models/zip_code_response.dart';
import '../../utilities/user_session.dart';
import '../api_address.dart';
import '../request/request_calculate_order.dart';
import '../request/request_customer_token.dart';
import '../request/request_order_calculation.dart';
import '../request/request_place_open_po_order.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Address.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  static final ApiService _instance = ApiService(Dio());

  factory ApiService.init() {
    final Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    return ApiService(dio);

    // return _instance;
  }

  factory ApiService.shared() {
    final Dio dio = Dio();
    dio.options.headers['authorization'] =
        "Bearer ${UserSessionManager.shared.customerToken.token}";
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    return ApiService(dio);
  }

  factory ApiService.clientNoLogger() {
    final Dio dio = Dio();
    debugPrint("token ${UserSessionManager.shared.customerToken.token}");
    dio.options.headers['authorization'] =
        "Bearer ${UserSessionManager.shared.customerToken.token}";
    return ApiService(dio);
  }

  static ApiService get instance => _instance;

  //? Example: https://hydra.unicity.net/v5a/loginTokens
  //? body
  //? {"type": "base64", "value": "Mjk3MDQ2NjoxMjM0", "namespace": "https://hydra.unicity.net/v5a/customers"}
  @POST(Address.loginTokens)
  Future<CustomerToken> getLoginTokens(
      @Body() RequestPostCustomerToken request);

  //? Example: https://hydra.unicity.net/v5a/customers/3d9104cc2fa45dbd0bdd1a4261f6969e
  @GET(Address.customerData)
  Future<UserInfo> getCustomerData(@Path('id') String id);

  //? Example: https://hydra.unicity.net/v5a/customers/3d9104cc2fa45dbd0bdd1a4261f6969e/profilePicture
  @GET(Address.profilePicture)
  Future<ProfilePicture> getProfilePicture(@Path('id') String id);

  //? Example: https://hydra.unicity.net/v5a/customers/me/managedwarehouses
  @GET(Address.managedWarehouse)
  Future<ManagedWarehouses> getManagedWarehouses();

  //? Example: https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/inventoryRecords?expand=item
  @GET(Address.inventoryRecords)
  Future<InventoryRecords> getInventoryRecords(
      @Path('id') String id, @Query("expand") String expand);

  //? Example: https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/inventoryMovementRecords?dateMoved=[2019-01-01;2021-06-01]&expand=catalogSlide,terms
  @GET(Address.inventoryMovementRecords)
  Future<List<InventoryMovementRecords>> getInventoryMovementRecords(
      @Path('id') String id,
      @Query("dateMoved") String dateMoved,
      @Query("expand") String expand);

  //? Example: https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/ordersAndRmas?dateCreated=[2019-01-01;2019-06-01]&expand=order,rma
  @GET(Address.ordersAndRmas)
  Future<OrdersAndRmas> getOrdersAndRmas(@Path('id') String id,
      @Query("dateCreated") String dateCreated, @Query("expand") String expand);

  //? Example: https://hydra.unicity.net/v5a/customers?unicity=108357166&expand=customer
  @GET(Address.customers)
  Future<FindCustomer> findCustomer(
      @Query("unicity") int id, @Query("expand") String expand);

  //? Example: https://hydra.unicity.net/v5a/customers?unicity=108357166&expand=customer
  @GET(Address.customers)
  Future<GuestUserInfoList> getCustomerInfo(
      @Query("unicity") int id, @Query("expand") String expand);

  //? Example: https://hydra.unicity.net/v5a/customers?fulltext=Test&sponsor.id.unicity=1
  @GET(Address.customers)
  Future<SearchCustomer> searchCustomer(@Query('fulltext') String searchKey,
      @Query('sponsor.id.unicity') int userId);

  @POST(Address.orderTerms)
  Future<CustomerToken> getOrderTerms(
      @Body() RequestPostCaclulateOrder request);

  //? Example: https://hydra.unicity.net/v5a/orderlines?order.customer.id.unicity=2970466&order.dateCreated=[2020-11;2021-06]&criteria=easyship&expand=catalogSlide,order,order.customer&order.market=TH
  @GET(Address.orderLines)
  Future<OrderLines> getOrderLines(
      @Query('order.customer.id.unicity') String userId,
      @Query('order.dateCreated') String dateCreated,
      @Query('criteria') String criteria,
      @Query('expand') String expand,
      @Query('order.market') String market);

  //? Example: https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/orders
  //? Body
  //? { "customer": { "href": "https://hydra.unicity.net/v5a/customers?unicity=108357166" }, "lines": { "items": [ { "item": { "href": "https://hydra.unicity.net/v5a/items?id.unicity=17532"}, "quantity": "1"}, {"item": {"href": "https://hydra.unicity.net/v5a/items?id.unicity=17532"},"quantity": "2"}]},
  //?  "shipToName": {"firstName": "First","lastName": "Last"},"shipToPhone": "555-555-5555","shipToEmail": "test@test.com","shipToAddress": {"city": "Bangkok","country": "TH","state": "","address1": "Rotenarmeestrasse 1", "zip": "90109"},
  //?  "shippingMethod": { "href": "https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/shippingmethods?type=WillCall"},
  //? "notes": "batch XXYY by First Last", "transactions": {"items": [{"amount": "this.terms.total","type": "record","method": "Cash"}]}}
  @POST(Address.orders)
  Future<PlaceOrder> getPlaceOrders(@Body() String request);

  //? Example: https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/orders
  //? Body
  //? {"customer":{"mainAddress":{"city":"กรุงเทพมหานคร   ","country":"TH","state":"","zip":"10200","address1":"Ratchaprop ","address2":"\n                                Sub-Area\n                                พระบรมมหาราชวัง\n                                    Area\n                                พระนคร"},"humanName":{"firstName":"Test","lastName":"Domain","firstName@th":"ทดสอบ","lastName@th":"โดเมน"},"enroller":{"href":"https://hydra.unicity.net/v5a/customers?id.unicity=108357166"},
  //? "sponsor":{"href":"https://hydra.unicity.net/v5a/customers?id.unicity=108357166"},"birthDate":"2000-12-01","maritalStatus":"Single","email":"nomail@unicity.com","taxTerms":{"taxId":"4480426014170"},"homePhone":"990099009","mobilePhone":"9900990099","entryPeriod":"2021-08","gender":"male","password":{"value":"4480426014170"},"type":"Associate","source":{"agent":"MLBS-DSCTools-TH","campaign":null,"medium":"Internet","platform":"Mac OS","referrer":null,"version":null}},
  //? "lines":{"items":[{"item":{"href":"https://hydra.unicity.net/v5a/items?id.unicity=20817"},"quantity":1}]},"shipToName":{"firstName":"Test","lastName":"Domain"},"shipToPhone":"990099009","shipToEmail":"nomail@unicity.com","notes":"enrollment|dsc|pc web|tha||108357166|","shipToAddress":{"city":"1","country":"TH","state":"","address1":"Ratchaprop ","address2":"\n                                Sub-Area\n                                พระบรมมหาราชวัง\n                                    Area\n                                พระนคร","zip":""},
  //? "shippingMethod":{"href":"https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c/shippingmethods?type=WillCall"},"transactions":{"items":[{"amount":"this.terms.total","type":"record","method":"Cash"}]},"terms":{"period":"2021-08"},"source":{"agent":"MLBS-DSCTools-TH","campaign":null,"medium":"Internet","platform":"Mac OS","referrer":null,"version":null}}
  @POST(Address.orders)
  Future<EnrollForm> placeEnrollOrder(@Body() String request);

  //? Example: https://hydra.unicity.net/v5a/orders/35e960ce25f719c6d12819cc35daab6c7fc1230ca0bb7863bbfb029caa40bb7a
  @GET(Address.salesOrderDetails)
  Future<SalesReportDetails> salesReportDetails(
      @Path('orderCode') String orderCode);
}

@RestApi(baseUrl: Address.memberCallsBase)
abstract class MemberCallsService {
  factory MemberCallsService(Dio dio, {String baseUrl}) = _MemberCallsService;

  factory MemberCallsService.init() {
    final Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    dio.options.headers['authorization'] =
        "Bearer ${UserSessionManager.shared.customerToken.token}";
    dio.options.headers['Content-Type'] = "application/json;charset=utf-8 ";
    return MemberCallsService(dio);
  }

  //Common apis
  //? url=https://member-calls2.unicity.com/dictionary/publish?lang=TH%2CEN
  @GET(Address.dictionary)
  Future<CustomerToken> getTranslations(@Query("lang") String lang);

  //? url=https://member-calls.unicity.com/ALL/DSC/getdata.php?type=106&mode=12&dscid=2970466
  @GET(Address.validOrders)
  Future<List<OpenPO>> getAllOpenPo(@Query("type") String type,
      @Query("mode") String mode, @Query("dscid") String dscid);

  //? url=https://member-calls.unicity.com/All/DSC/THA/getdata.php?type=203&ponumber=BKM%202021-06-W003
  @GET("${Address.allDscPath}/THA/getdata.php")
  Future<OpenPlaceOrderId> getOpenOrderId(
      @Query("type") String type, @Query("ponumber") String ponumber);

  //? url=https://member-calls.unicity.com/All/DSC/THA/getdata.php?type=204&order_id=50291
  @GET("${Address.allDscPath}/THA/getdata.php")
  Future<List<OpenPlaceOrderDetails>> getOpenOrderDetails(
      @Query("type") String type, @Query("order_id") String orderId);

  //? url=https://member-calls.unicity.com/ALL/DSC/THA/barcode/redirect.php?lang=en&order=423135644&token=2096fb4a-783d-4b60-baec-f5880bab1e7a&user=2970466
  @GET("${Address.allDscPath}/THA/barcode/redirect.php")
  Future<dynamic> getBarcodePath(
      @Query('lang') String lang,
      @Query('order') String order,
      @Query('token') String token,
      @Query('user') String user);

  //? url=https://member-calls.unicity.com/period_DSC_PO.asp
  @POST("/period_DSC_PO.asp")
  @FormUrlEncoded()
  Future<dynamic> valiadateOrder(@Field() String country, @Field() String dsc);

  //? url=https://member-calls.unicity.com/ALL/DSC/THA/barcode/redirect.php?lang=en&order=423135644&token=2096fb4a-783d-4b60-baec-f5880bab1e7a&user=2970466
  @POST("${Address.allDscPath}/THA/getdata.php")
  Future<OpenPOCreateOrderResponse> placeOrder(
      @Query('type') String type, @Body() RequestPlaceOpenPoOrder request);

  //? url=https://member-calls.unicity.com/All/DSC/THA/getdata.php?type=206&username=2970466
  @GET("${Address.allDscPath}/THA/getdata.php")
  Future<UserId> getUserId(
      @Query('type') String type, @Query('username') String username);

  //? url=https://member-calls.unicity.com/ALL/DSC/THA/getdata.php?type=2&distID=2970466&token=c1fd1d7c-7ad5-4143-ba27-f73e4520a376
  @GET("${Address.allDscPath}/THA/getdata.php")
  Future<List<EasyShipReports>> getEasyShipReports(@Query('type') String type,
      @Query('distID') String distID, @Query('token') String token);

  //? url=https://member-calls.unicity.com/api/unishop/v1/th/validate_address/idcard
  @POST(Address.validateIdCard)
  @FormUrlEncoded()
  Future<GovtIdVerify> validateIdCard(@Field() String strID);

  //? url=https://member-calls.unicity.com/ALL/DSC/THA/getdata.php?type=getAllProvince
  @GET(Address.validOrders)
  Future<List<ProvinceItem>> getAllProvince(@Query("type") String type);

  //? url=https://dsc-th.unicity.com/getdata.php?type=getAmphuresByProvince&province_id=1
  @GET(Address.validOrders)
  Future<List<AmphurItem>> getAmphuresByProvince(
      @Query("type") String type, @Query("province_id") String provinceId);

  //? url=https://dsc-th.unicity.com/getdata.php?type=getDistrictsByAmphur&amphur_id=178
  @GET(Address.validOrders)
  Future<List<DisctrictItem>> getDistrictsByAmphur(
      @Query("type") String type, @Query("amphur_id") String amphurId);

  //? url=https://dsc-th.unicity.com/getdata.php?type=getZipcodeByDistricts&district_id=240102
  @GET(Address.validOrders)
  Future<List<ZipCodeResponse>> getZipcodeByDistricts(
      @Query("type") String type, @Query("district_id") String districtId);

  //? url=https://member-calls.unicity.com/ALL/DSC/THA/getdata.php?type=0000
  @GET(Address.validOrders)
  Future<String> checkOrderEntryStatus(@Query("type") String type);

  //? url=https://member-calls.unicity.com/ALL/DSC/THA/getdata.php?type=0000
  @POST(Address.period)
  @FormUrlEncoded()
  Future<String> getPeriodResponse(@Field("country") String country,
      @Field("joinPeriod") String joinPeriod, @Field("system") String system);

  //? url=https://member-calls.unicity.com/All/DSC/THA/getdata.php?type=getAttachment&sid=BKM%202021-08-W002
  @GET(Address.validOrders)
  Future<String> getPoOrderAttachment(
      @Query("type") String type, @Query("sid") String sid);

  //? url=https://member-calls.unicity.com/ALL/DSC/THA/getdata.php?type=0000
  @GET(Address.validOrders)
  Future<GetPeriodLogResponse> getPeriodLog(@Query("type") String type,
      @Field("data") String data, @Field("customerID") String customerID);

  //? url=https://member-calls.unicity.com/ALL/DSC/THA/getdata.php?type=purchaseLog
  @POST(Address.validOrders)
  @FormUrlEncoded()
  Future<String> logEnrollerData(
      @Query("type") String type, @Field("data") String data);

  //? url=https://member-calls.unicity.com/ALL/DSC/THA/getdata.php?type=purchaseLog
  @POST(Address.validOrders)
  @FormUrlEncoded()
  Future<String> logPurchaseOrder(
      @Query("type") String type,
      @Field("data") String data,
      @Field("customerID") String customerID,
      @Field("period") String period,
      @Field("periodLog") String periodLog);

  //? url=https://member-calls.unicity.com/THA/THA_DSC_Enroll_ValidationV2.asp
  @POST(Address.verifyEnroll)
  @FormUrlEncoded()
  // Future<EnrollResponse> verifyEnrollForm(
  Future<dynamic> verifyEnrollForm(
    @Field("language") String language,
    @Field("firstName") String firstName,
    @Field("lastName") String lastName,
    @Field("firstName@th") String firstNameTh,
    @Field("lastName@th") String lastNameTh,
    @Field("gender") String gender,
    @Field("maritalStatus") String maritalStatus,
    @Field("birthDate") String birthDate,
    @Field("address1") String address1,
    @Field("address2") String address2,
    @Field("city") String city,
    @Field("country") String country,
    @Field("zip") String zip,
    @Field("email") String email,
    @Field("mobilePhone") String mobilePhone,
    @Field("homePhone") String homePhone,
    @Field("password") String password,
  );

  // //? url=https://member-calls.unicity.com/ALL/DSC/THA/getdata.php?type=getBAInfo
  @POST(Address.validOrders)
  Future<List<SearchedUserInfo>> searchUsersByHref(
      @Query("type") String type, @Body() List<String> task);

  //? url=https://member-calls.unicity.com/ALL/DSC/THA/getdata.php?type=104&itemcode=17532&selectname=itemcode190
  @POST(Address.validOrders)
  Future<dynamic> getOrderEntryProductInfo(
      @Query("type") String type,
      @Query("itemcode") String itemcode,
      @Query("selectname") String selectname);

  //? url=https://member-calls.unicity.com/ALL/DSC/THA/getdata.php?type=31&token=6e4234c7-fee7-4160-9e17-c029415a6b4f&warehouse=https://hydra.unicity.net/v5a/warehouses/9e41f330617aa2801b45620f8ffc5615306328fa0bd2255b0d42d7746560d24c
  @POST(Address.validOrders)
  Future<List<OrderEntryItem>> getOrderEntryProductList(
      @Query("type") String type,
      @Query("token") String token,
      @Query("warehouse") String warehouse);

  //? url=https://member-calls.unicity.com/ALL/Email_Validation.asp
  @POST(Address.validateEmail)
  @FormUrlEncoded()
  Future<dynamic> validateEmail(
      @Field("language") String language, @Field("email") String email);

  //? url=https://member-calls.unicity.com/ALL/DSC/THA/getdata.php?token=weylbzpplvy6wq9ae5rma&temp_id=BKM%20-00-W001&id=0&type=207
  @POST(Address.validOrders)
  @FormUrlEncoded()
  Future<dynamic> uploadFile(
      @Query("token") String token,
      @Query("temp_id") String tempId,
      @Query("id") String id,
      @Query("type") String type,
      FormData data);

  //? url=https://member-calls.unicity.com/ALL/DSC/THA/barcode/order_verify.php
  @POST(Address.orderVerify)
  @FormUrlEncoded()
  Future<VerifyOrderResponse> verifyOrder(@Body() PlaceOrder data);

  //? url=https://member-calls.unicity.com/ALL/DSC/THA/barcode/order_verify.php
  @POST(Address.orderVerify)
  @FormUrlEncoded()
  Future<VerifyOrderResponse> verifyEnrollOrder(@Body() EnrollForm data);

  //? url=https://member-calls.unicity.com/ALL/DSC/THA/barcode/order_verify.php
  @POST(Address.orderVerify)
  @FormUrlEncoded()
  Future<GovtIdVerify> enrollValidation(
      @Field("language") String language,
      @Field("firstName") String firstName,
      @Field("lastName") String lastName,
      @Field("firstName@th") String firstNameTh,
      @Field("lastName@th") String lastNameTh,
      @Field("gender") String gender,
      @Field("maritalStatus") String maritalStatus,
      @Field("birthDate") String birthDate,
      @Field("product[0][quantity]") String quantity,
      @Field("address1") String address1,
      @Field("address2") String address2,
      @Field("country") String country,
      @Field("zip") String zip,
      @Field("email") String email,
      @Field("mobilePhone") String mobilePhone,
      @Field("homePhone") String homePhone,
      @Field("password") String password);

  //? url=https://member-calls.unicity.com/ALL/DSC/THA/email/send_order_online_TH.php
  @POST(Address.sendOrderOnline)
  @FormUrlEncoded()
  Future<SendOrderOnlineResponse> sendOrderOnline(
    @Field("forename") String forename,
    @Field("address") String address,
    @Field("email") String email,
    @Field("orderNumber") String orderNumber,
    @Field("orderType") String orderType,
    @Field("disID") String disID,
    @Field("product[0][item][href]") String href,
    @Field("product[0][quantity]") String quantity,
    @Field("period") String period,
    @Field("pv") String pv,
    @Field("amount") int amount,
  );

  //? Example: https://member-calls.unicity.com/ALL/DSC/THA/getdata.php?type=4&datepicker1=2021-09-13&datepicker2=2021-09-13&token=daac50bb-9e17-4d31-b824-c7841f03d1eb&lang=th&id=100280466&action=1
  @GET(Address.validOrders)
  Future<List<SalesReportOrderItem>> getSalesReports(
      @Query('type') String type,
      @Query('datepicker1') String datepicker1,
      @Query('datepicker2') String datepicker2,
      @Query('token') String token,
      @Query('lang') String lang,
      @Query('id') String id,
      @Query('action') String action);

  //? Example: https://member-calls.unicity.com/ALL/DSC/THA/getdata.php?type=4&datepicker1=2021-09-13&datepicker2=2021-09-13&token=daac50bb-9e17-4d31-b824-c7841f03d1eb&lang=th&id=100280466&action=3
  @GET(Address.validOrders)
  Future<List<SalesReportRmaItem>> getSalesRmaReports(
      @Query('type') String type,
      @Query('datepicker1') String datepicker1,
      @Query('datepicker2') String datepicker2,
      @Query('token') String token,
      @Query('lang') String lang,
      @Query('id') String id,
      @Query('action') String action);

  //? Example: https://member-calls.unicity.com/ALL/DSC/THA/getdata.php?type=4&datepicker1=2021-09-13&datepicker2=2021-09-13&lang=th&token=daac50bb-9e17-4d31-b824-c7841f03d1eb&action=2
  @GET(Address.validOrders)
  Future<List<SalesReportItemItem>> getSalesItemReports(
      @Query('type') String type,
      @Query('datepicker1') String datepicker1,
      @Query('datepicker2') String datepicker2,
      @Query('token') String token,
      @Query('action') String action);
}

@RestApi(baseUrl: Address.memberCalls2Base)
abstract class MemberCalls2Service {
  factory MemberCalls2Service(Dio dio, {String baseUrl}) = _MemberCalls2Service;

  factory MemberCalls2Service.init() {
    final Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    return MemberCalls2Service(dio);
  }

  //? Example: https://member-calls.unicity.com/ALL/DSC/getdata.php?type=barcode&datepicker1=2021-06-01&datepicker2=2021-06-18&token=85905f08-b320-4e20-a6d1-2d96ebec6481&lang=en&id=2970466&action=1
  @GET(Address.validOrders)
  Future<List<String>> getValidOrders(
      @Query('type') String type,
      @Query('datepicker1') String datepicker1,
      @Query('datepicker2') String datepicker2,
      @Query('token') String token,
      @Query('lang') String lang,
      @Query('id') String id,
      @Query('action') String action);

  //? Example: https://member-calls.unicity.com/ALL/DSC/getdata.php?type=barcode&datepicker1=2021-06-01&datepicker2=2021-06-18&token=85905f08-b320-4e20-a6d1-2d96ebec6481&lang=en&id=2970466&action=1
  @POST("ordercalc")
  Future<OrderCalculationResponse> orderCalculation(
      @Body() RequestOrderCalculation request);

  //? Example: https://member-calls2.unicity.com/etlV2/user/forceResetPassword/257461866
  @POST("${Address.forceResetPassword}/{id}")
  Future<PasswordResetResponse> forceResetPassword(@Path("id") String id);

  //? Example: https://member-calls2.unicity.com/unishop-fn-misc/cashcoupon_quota/2970466?pv=25
  @GET("${Address.cashCoupon}/2970466")
  Future<CashCouponResponse> getCashCoupon(@Query('pv') String pv);

  //? Example: https://member-calls2.unicity.com/etlV2/cache/clearAll?baId=2970466
  @DELETE(Address.clearOrderCache)
  Future<ClearOrderCacheResponse> clearOrderCache(@Query('baId') String baId);
}
