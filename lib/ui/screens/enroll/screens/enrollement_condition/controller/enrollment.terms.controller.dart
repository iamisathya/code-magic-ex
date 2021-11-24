import 'package:collection/collection.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

import '../../../../../../constants/globals.dart';
import '../../../../../../utilities/constants.dart';

class EnrollmentTermsController extends GetxController {
  RxBool isLoading = false.obs;

  List<String> getTermsConditions() {
    final Map<String, dynamic>? found = termsAndConditions.firstWhereOrNull(
        (market) => market["countryCode"] == Globals.countryCode);
    final List<String> tems = found == null
        ? []
        : found["content"][Globals.defaultLanguage.toUpperCase() != "EN"
            ? "native"
            : "english"] as List<String>;
    return tems;
  }
}
