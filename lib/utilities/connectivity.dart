import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityManager {
  /// Singleton
  static ConnectivityManager shared = ConnectivityManager._();

  /// Stream Controller
  // ignore: close_sinks
  final _streamController = BehaviorSubject<ConnectivityStatus>.seeded(ConnectivityStatus.unknown);
  Stream<ConnectivityStatus> get connectionStatus => _streamController.stream;

  final Connectivity _connectivity = Connectivity();

  /// Private Constructor
  ConnectivityManager._() {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) => _setConnectivityStatus(result));
  }

  /// Helper Method - [doInitialCheck]
  /// Get the connectivity status and set it to stream.
  Future<void> doInitialCheck() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
      return;
    }
    return _setConnectivityStatus(result);
  }


  /// Helper Method - [_setConnectivityStatus]
  void _setConnectivityStatus(ConnectivityResult result) {
    final status = _getStatusFromResult(result);
    debugPrint("Connectivity Status : ${status.toString()}");
    _streamController.sink.add(status);
  }

  /// Helper Method - [getRawStatus]
  /// Return the Connectivity Status in Raw String format
  String getRawStatus() => _streamController.value.toString().split('.').last.toLowerCase();

  /// Helper Method - [isAvailable]
  /// Return true if network is available, Otherwise false.
  bool isAvailable() =>
      _streamController.value == ConnectivityStatus.wiFi || _streamController.value == ConnectivityStatus.cellular;

  /// Helper Method - [isNotAvailable]
  /// Return true if network is not available. Otherwise false.
  bool isNotAvailable() => !isAvailable();

  /// Helper Method - [_getStatusFromResult]
  /// Convert from the third part enum to our own enum
  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.wiFi;
      case ConnectivityResult.none:
        return ConnectivityStatus.offline;
      default:
        return ConnectivityStatus.offline;
    }
  }
}

/// Helper Enum - [ConnectivityStatus]
enum ConnectivityStatus { wiFi, cellular, offline, unknown }
