import 'package:code_magic_ex/api/config/member_class.dart';
import 'package:code_magic_ex/models/easy_ship_reports.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/utilities/core/parsing.dart';
import 'package:code_magic_ex/utilities/enums.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:get/get.dart';

import 'package:code_magic_ex/utilities/Logger/logger.dart';
import 'package:intl/intl.dart';

class EasyShipController extends GetxController {
  RxBool loading = false.obs;
  RxString errorMessage = "".obs;

  List<EasyShipReports> allEasyShipOrders = <EasyShipReports>[];
  List<EasyShipReports> _tempEasyShipOrders = <EasyShipReports>[];

  static int sortName = 0;
  static int sortStatus = 1;
  bool isAscending = true;
  EasyShipTypes currentType = EasyShipTypes.orderNumber;

  List<EasyShipReports> get getEasyShipReports => _tempEasyShipOrders;
  int get easyShipReportsCount => _tempEasyShipOrders.length;
  bool get isEasyShipReportsEmpty => _tempEasyShipOrders.isEmpty;

  Future<void> getAllOrderlines({String userId = "3011266"}) async {
    loading(true);
    update();
    try {
      allEasyShipOrders = await MemberCallsService.init().getEasyShipReports(
          kEasyShipReports, userId, UserSessionManager.shared.customerToken.token);
      allEasyShipOrders = addTotalRowAfterEachUniqueItemSet();
      _tempEasyShipOrders = allEasyShipOrders;
      loading(false);
      update();
    } catch (err) {
      loading(false);
      errorMessage(err.toString());
      LoggerService.instance.e(err.toString());
      update();
    }
  }

  void onSortCulumn(EasyShipTypes sortStatus) {
    currentType = sortStatus;
    isAscending = !isAscending;
    switch (sortStatus) {
      case EasyShipTypes.orderNumber:
        if (isAscending) {
          _tempEasyShipOrders
              .sort((a, b) => a.orderNumber.compareTo(b.orderNumber));
        } else {
          _tempEasyShipOrders
              .sort((b, a) => a.orderNumber.compareTo(b.orderNumber));
        }
        break;
      case EasyShipTypes.period:
        if (isAscending) {
          _tempEasyShipOrders.sort((a, b) => a.pvDate.compareTo(b.pvDate));
        } else {
          _tempEasyShipOrders.sort((b, a) => a.pvDate.compareTo(b.pvDate));
        }
        break;
      case EasyShipTypes.productName:
        if (isAscending) {
          _tempEasyShipOrders.sort((a, b) => a.name.compareTo(b.name));
        } else {
          _tempEasyShipOrders.sort((b, a) => a.name.compareTo(b.name));
        }
        break;
      case EasyShipTypes.itemCode:
        if (isAscending) {
          _tempEasyShipOrders.sort((a, b) => a.itemName.compareTo(b.itemName));
        } else {
          _tempEasyShipOrders.sort((b, a) => a.itemName.compareTo(b.itemName));
        }
        break;
      case EasyShipTypes.pv:
        if (isAscending) {
          _tempEasyShipOrders.sort((a, b) => a.pv.compareTo(b.pv));
        } else {
          _tempEasyShipOrders.sort((b, a) => a.pv.compareTo(b.pv));
        }
        break;
      case EasyShipTypes.price:
        if (isAscending) {
          _tempEasyShipOrders
              .sort((a, b) => a.totalPrice.compareTo(b.totalPrice));
        } else {
          _tempEasyShipOrders
              .sort((b, a) => a.totalPrice.compareTo(b.totalPrice));
        }
        break;
      default:
    }
    update();
  }

  //*  This will find & returns total unique order size
  int totalUniqueOrderItemSize() {
    final List<EasyShipReports> resArr = [];
    for (final item in _tempEasyShipOrders) {
      final i =
          resArr.indexWhere((x) => x.orderNumber == item.orderNumber);
      if (i <= -1) {
        resArr.add(item);
      }
    }
    return resArr.length;
  }

  int forceParse(String str) {
   return Parsing.doubleFrom(str.replaceAll(",", ""))!.toInt();
  }

  List<EasyShipReports> addTotalRowAfterEachUniqueItemSet() {
    final Map<String, List<EasyShipReports>> easyShipMap = groupBy(allEasyShipOrders, (obj) => obj.orderNumber);
    //* Adding empty EasyShipReports object after each set of unique orders
    for(final objectItem in easyShipMap.values) {
      final int totalAmount = objectItem.fold(0, (sum, item) => sum + forceParse(item.totalPrice));
      final int totalVolume = objectItem.fold(0, (sum, item) => sum + item.pv);
      final EasyShipReports emptyReport = EasyShipReports(orderNumber: "", itemName: "Total", name: "", price: "", pv: totalVolume, pvDate: "", totalPrice: NumberFormat("#,###").format(totalAmount));
      objectItem.add(emptyReport);
    }
    // ! Need to optimise this
    final List<EasyShipReports> easyShipReports = [];
    for(final objectItems in easyShipMap.values) {
      for (var i = 0; i < objectItems.length; i++) {
        easyShipReports.add(objectItems[i]);
      }
    }
    return easyShipReports;
  }
}
