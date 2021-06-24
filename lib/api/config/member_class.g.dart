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
