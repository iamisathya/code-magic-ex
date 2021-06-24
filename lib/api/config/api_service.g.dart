// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://hydra.unicity.net/v5a/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CustomerToken> getLoginTokens(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CustomerToken>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/loginTokens',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CustomerToken.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserInfo> getCustomerData(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserInfo>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/customers/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserInfo.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ManagedWarehouses> getManagedWarehouses() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ManagedWarehouses>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/customers/me/managedwarehouses',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ManagedWarehouses.fromJson(_result.data!);
    return value;
  }

  @override
  Future<InventoryRecords> getInventoryRecords(id, expand) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'expand': expand};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<InventoryRecords>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/warehouses/$id/inventoryRecords',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = InventoryRecords.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<InventoryMovementRecords>> getInventoryMovementRecords(
      id, dateMoved, expand) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'dateMoved': dateMoved,
      r'expand': expand
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<InventoryMovementRecords>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(
                    _dio.options, '/warehouses/$id/inventoryMovementRecords',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            InventoryMovementRecords.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<OrdersAndRmas> getOrdersAndRmas(id, dateCreated, expand) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'dateCreated': dateCreated,
      r'expand': expand
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<OrdersAndRmas>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/warehouses/$id/ordersAndRmas',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OrdersAndRmas.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FindCustomer> findCustomer(id, expand) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'unicity': id,
      r'expand': expand
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FindCustomer>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/customers',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FindCustomer.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SearchCustomer> searchCustomer(searchKey, userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'fulltext': searchKey,
      r'sponsor.id.unicity': userId
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SearchCustomer>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/customers',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SearchCustomer.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CustomerToken> getOrderTerms(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CustomerToken>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/orderTerms',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CustomerToken.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OrderLines> getOrderLines(
      userId, dateCreated, criteria, expand, market) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'order.customer.id.unicity': userId,
      r'order.dateCreated': dateCreated,
      r'criteria': criteria,
      r'expand': expand,
      r'order.market': market
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<OrderLines>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/orderlines',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OrderLines.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserInfo> getPlaceOrders(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserInfo>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/warehouses/{id}/orders',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserInfo.fromJson(_result.data!);
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

class _MemberCalls2Service implements MemberCalls2Service {
  _MemberCalls2Service(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://member-calls2.unicity.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<String>> getValidOrders(
      type, datepicker1, datepicker2, token, lang, id, action) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'type': type,
      r'datepicker1': datepicker1,
      r'datepicker2': datepicker2,
      r'token': token,
      r'lang': lang,
      r'id': id,
      r'action': action
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<String>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'ALL/DSC/getdata.php',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!.cast<String>();
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
