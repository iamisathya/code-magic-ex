import 'package:collection/collection.dart';
import 'package:get/state_manager.dart';

import '../../../../../../data/provider/globals.dart';
import '../../../../../utils/constants.dart';

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
