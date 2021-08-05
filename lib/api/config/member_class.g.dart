// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_class.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _MemberCallsService implements MemberCallsService {
  _MemberCallsService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://member-calls.unicity.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CustomerToken> getTranslations(lang) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lang': lang};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CustomerToken>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'dictionary/publish',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CustomerToken.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<OpenPO>> getAllOpenPo(type, mode, dscid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'type': type,
      r'mode': mode,
      r'dscid': dscid
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<OpenPO>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'ALL/DSC/THA/getdata.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => OpenPO.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<OpenPlaceOrderId> getOpenOrderId(type, ponumber) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'type': type,
      r'ponumber': ponumber
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<OpenPlaceOrderId>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'ALL/DSC/THA/getdata.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OpenPlaceOrderId.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<OpenPlaceOrderDetails>> getOpenOrderDetails(type, orderId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'type': type,
      r'order_id': orderId
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<OpenPlaceOrderDetails>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'ALL/DSC/THA/getdata.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            OpenPlaceOrderDetails.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<dynamic> getBarcodePath(lang, order, token, user) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'lang': lang,
      r'order': order,
      r'token': token,
      r'user': user
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, 'ALL/DSC/THA/barcode/redirect.php',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> valiadateOrder(country, dsc) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'country': country, 'dsc': dsc};
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded')
        .compose(_dio.options, '/period_DSC_PO.asp',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<OpenPOCreateOrderResponse> placeOrder(type, request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'type': type};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<OpenPOCreateOrderResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'ALL/DSC/THA/getdata.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OpenPOCreateOrderResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserId> getUserId(type, username) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'type': type,
      r'username': username
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserId>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'ALL/DSC/THA/getdata.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserId.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<EasyShipReports>> getEasyShipReports(type, distID, token) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'type': type,
      r'distID': distID,
      r'token': token
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<EasyShipReports>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'ALL/DSC/THA/getdata.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => EasyShipReports.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<GovtIdVerify> validateIdCard(strID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'strID': strID};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GovtIdVerify>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, 'api/unishop/v1/th/validate_address/idcard',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GovtIdVerify.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<ProvinceItem>> getAllProvince(type) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'type': type};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ProvinceItem>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'ALL/DSC/THA/getdata.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ProvinceItem.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<AmphurItem>> getAmphuresByProvince(type, provinceId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'type': type,
      r'province_id': provinceId
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<AmphurItem>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'ALL/DSC/THA/getdata.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => AmphurItem.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<DisctrictItem>> getDistrictsByAmphur(type, amphurId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'type': type,
      r'amphur_id': amphurId
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<DisctrictItem>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'ALL/DSC/THA/getdata.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => DisctrictItem.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<ZipCodeResponse>> getZipcodeByDistricts(type, districtId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'type': type,
      r'district_id': districtId
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<ZipCodeResponse>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'ALL/DSC/THA/getdata.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ZipCodeResponse.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<String> checkOrderEntryStatus(type) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'type': type};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, 'ALL/DSC/THA/getdata.php',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<String> getPeriodResponse(country, joinPeriod, system) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'country': country,
      'joinPeriod': joinPeriod,
      'system': system
    };
    final _result = await _dio.fetch<String>(_setStreamType<String>(Options(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded')
        .compose(_dio.options, 'period.asp',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<GetPeriodLogResponse> getPeriodLog(type, data, customerID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'type': type};
    final _data = {'data': data, 'customerID': customerID};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetPeriodLogResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'ALL/DSC/THA/getdata.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetPeriodLogResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<String> logPurchaseOrder(
      type, data, customerID, period, periodLog) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'type': type};
    final _data = {
      'data': data,
      'customerID': customerID,
      'period': period,
      'periodLog': periodLog
    };
    final _result = await _dio.fetch<String>(_setStreamType<String>(Options(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded')
        .compose(_dio.options, 'ALL/DSC/THA/getdata.php',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<dynamic> verifyEnrollForm(
      language,
      firstName,
      firstNameTh,
      lastNameTh,
      gender,
      maritalStatus,
      birthDate,
      address1,
      address2,
      city,
      country,
      zip,
      email,
      mobilePhone,
      homePhone,
      password) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'language': language,
      'firstName': firstName,
      'firstName@th': firstNameTh,
      'lastName@th: ': lastNameTh,
      'gender': gender,
      'maritalStatus': maritalStatus,
      'birthDate': birthDate,
      'address1': address1,
      'address2': address2,
      'city': city,
      'country': country,
      'zip': zip,
      'email': email,
      'mobilePhone': mobilePhone,
      'homePhone': homePhone,
      'password': password
    };
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded')
        .compose(_dio.options, 'THA/THA_DSC_Enroll_ValidationV2.asp',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<List<SearchedUserInfo>> searchUsersByHref(type, task) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'type': type};
    final _data = task;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<SearchedUserInfo>>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'ALL/DSC/THA/getdata.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map(
            (dynamic i) => SearchedUserInfo.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<dynamic> getOrderEntryProductInfo(type, itemcode, selectname) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'type': type,
      r'itemcode': itemcode,
      r'selectname': selectname
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, 'ALL/DSC/THA/getdata.php',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<List<OrderEntryItem>> getOrderEntryProductList(
      type, token, warehouse) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'type': type,
      r'token': token,
      r'warehouse': warehouse
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<OrderEntryItem>>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'ALL/DSC/THA/getdata.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => OrderEntryItem.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<dynamic> validateEmail(language, email) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'language': language, 'email': email};
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded')
        .compose(_dio.options, 'ALL/Email_Validation.asp',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> uploadFile(token, tempId, id, type, data) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'token': token,
      r'temp_id': tempId,
      r'id': id,
      r'type': type
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded')
        .compose(_dio.options, 'ALL/DSC/THA/getdata.php',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<VerifyOrderResponse> verifyOrder(data) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<VerifyOrderResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, 'ALL/DSC/THA/getdata.php',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VerifyOrderResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<VerifyOrderResponse> sendOrderOnline(forename, address, email,
      orderNumber, orderType, disID, href, quantity, period, pv, amount) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'forename': forename,
      'address': address,
      'email': email,
      'orderNumber': orderNumber,
      'orderType': orderType,
      'disID': disID,
      'product[0][item][href]': href,
      'product[0][quantity]': quantity,
      'period': period,
      'pv': pv,
      'amount': amount
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<VerifyOrderResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, 'ALL/DSC/THA/getdata.php',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VerifyOrderResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
