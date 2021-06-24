


import 'dart:convert';

import 'package:code_magic_ex/api/api_address.dart';
import 'package:code_magic_ex/models/open_order_id.dart';
import 'package:code_magic_ex/models/open_po.dart';
import 'package:code_magic_ex/models/open_po_details.dart';
import 'package:code_magic_ex/models/user_token.dart';
import 'package:code_magic_ex/ui/screens/open_po/components/OPenPoOne.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'member_class.g.dart';

@RestApi(baseUrl: Address.memberCallsBase)
abstract class MemberCallsService {
  factory MemberCallsService(Dio dio, {String baseUrl}) = _MemberCallsService;

  factory MemberCallsService.init() {
    final Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    dio.options.headers['authorization'] =
        "Bearer a30be6a4-d6d5-4119-9e3a-84bfb90f71e2";
    dio.options.headers['Content-Type'] = "application/json;charset=utf-8 ";
    return MemberCallsService(dio);
  }

  //Common apis
  //? url=https://member-calls2.unicity.com/dictionary/publish?lang=TH%2CEN
  @GET(Address.dictionary)
  Future<CustomerToken> getTranslations(@Query("lang") String lang);

  //? url=https://member-calls.unicity.com/ALL/DSC/getdata.php?type=106&mode=12&dscid=2970466
  @GET(Address.validOrders)
  Future<List<OpenPO>> getAllOpenPo(@Query("type") String type, @Query("mode") String mode, @Query("dscid") String dscid);

  //? url=https://member-calls.unicity.com/All/DSC/THA/getdata.php?type=203&ponumber=BKM%202021-06-W003
  @GET("${Address.allDscPath}/THA/getdata.php")
  Future<OpenPlaceOrderId> getOpenOrderId(@Query("type") String type, @Query("ponumber") String ponumber);

  //? url=https://member-calls.unicity.com/All/DSC/THA/getdata.php?type=204&order_id=50291
  @GET("${Address.allDscPath}/THA/getdata.php")
  Future<List<OpenPlaceOrderDetails>> getOpenOrderDetails(@Query("type") String type, @Query("order_id") String orderId);
}
