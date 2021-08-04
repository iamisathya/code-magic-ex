import 'package:code_magic_ex/api/request/request_place_open_po_order.dart';
import 'package:code_magic_ex/models/amphur_item.dart';
import 'package:code_magic_ex/models/district_item.dart';
import 'package:code_magic_ex/models/easy_ship_reports.dart';
import 'package:code_magic_ex/models/govt_id_verify.dart';
import 'package:code_magic_ex/models/open_po_create_order_response.dart';
import 'package:code_magic_ex/models/order_entry_product_item.dart';
import 'package:code_magic_ex/models/provience_item.dart';
import 'package:code_magic_ex/models/search_reponse_by_href.dart';
import 'package:code_magic_ex/models/user_id.dart';
import 'package:code_magic_ex/models/zip_code_response.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import 'package:code_magic_ex/api/api_address.dart';
import 'package:code_magic_ex/models/open_order_id.dart';
import 'package:code_magic_ex/models/open_po.dart';
import 'package:code_magic_ex/models/open_po_details.dart';
import 'package:code_magic_ex/models/user_token.dart';

part 'member_class.g.dart';

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
  Future<dynamic> valiadateOrder(
      @Field() String country, @Field() String dsc);

  //? url=https://member-calls.unicity.com/ALL/DSC/THA/barcode/redirect.php?lang=en&order=423135644&token=2096fb4a-783d-4b60-baec-f5880bab1e7a&user=2970466
  @POST("${Address.allDscPath}/THA/getdata.php")
  Future<OpenPOCreateOrderResponse> placeOrder(
      @Query('type') String type,
      @Body() RequestPlaceOpenPoOrder request);

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

  //? url=https://member-calls.unicity.com/THA/THA_DSC_Enroll_ValidationV2.asp
  @POST(Address.verifyEnroll)
  @FormUrlEncoded()
  // Future<EnrollResponse> verifyEnrollForm(
  Future<dynamic> verifyEnrollForm(
    @Field("language") String language,
    @Field("firstName") String firstName,
    @Field("firstName@th") String firstNameTh,
    @Field("lastName@th: ") String lastNameTh,
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
}
