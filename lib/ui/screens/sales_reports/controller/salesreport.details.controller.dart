import 'package:dsc_tools/models/barcode_item_response.dart';
import 'package:dsc_tools/models/barcode_response.dart';
import 'package:get/get.dart';

import '../../../../api/config/api_service.dart';
import '../../../../models/sales_report_details.dart';
import '../../../../utilities/logger.dart';

class SalesReportDetailsController extends GetxController {
  RxString orderCode = "".obs;
  RxString orderNumber = "".obs;
  RxBool isLoading = false.obs;
  SalesReportDetails? salesReportDetails;
  late BarcodeResponse barcodeDetails;
  late BarCodeItemsResponse barcodeItems;

  @override
  void onInit() {
    final dynamic data = Get.arguments;
    if (data != null) {
      final args = data as Map<String, dynamic>;
      orderCode.value = args["orderCode"] as String;
      orderNumber.value = args["orderId"] as String;
      getOpenPlaceOrderDetails2();
      // getOpenPlaceOrderDetails(orderCode.value);
    }
    super.onInit();
  }

  int get listSize => salesReportDetails?.lines.items.length ?? 0;

  List<Items> get products => salesReportDetails?.lines.items ?? [];
  
  Future<void> getOpenPlaceOrderDetails2() async {
    isLoading.toggle();
    try {
      // * Getting order id from getOpenOrderId API - 203
      barcodeDetails =
          await MemberCallsService.init().getBarcodeDetails("_ga=GA1.2.1316239299.1632121654; PHPSESSID=dbpq6231h0pe0v9hc0oav8brm5; _gid=GA1.2.1973291869.1632382277; __cf_bm=g83McmerfcqxtdhiGFATq8b8A99IpLJEv.uiyDhy0WY-1632416053-0-AZdaMG45KBS/h/MQBVdgAJyPzzY0uX6Ql/zW6Fggzg5UAf3zaJ+Az41w2nWVVkuZHTrNqabsoWfFzKU4oLbY1Mqld5KRAzkCNNT/DW2dNSvun1nFras+le1rMdxwSFw0JA==", "423182123", "b5eb37c5-5644-492d-b703-817cf58bfa9e", "31512d2a1d4a2a5860bc785d27d1f7522ad2ddc6de4667f07aa6ac036f67662c");
          getOpenPlaceOrderDetails();
      isLoading.toggle();
    } catch (err) {
      isLoading.toggle();
      LoggerService.instance.e(err.toString());
    }
  }


  Future<void> getOpenPlaceOrderDetails() async {
    isLoading.toggle();
    try {
      const String data = "data%5Bterms%5D%5Bdiscount%5D%5Bamount%5D=0&data%5Bterms%5D%5Bperiod%5D=2021-09&data%5Bterms%5D%5Bpretotal%5D=5170&data%5Bterms%5D%5Btax%5D%5Bamount%5D=338.2&data%5Bterms%5D%5Btax%5D%5Bpercentage%5D=7&data%5Bterms%5D%5Bfreight%5D%5Bamount%5D=0&data%5Bterms%5D%5Bsubtotal%5D=5170&data%5Bterms%5D%5BtaxableTotal%5D=4831.8&data%5Bterms%5D%5Btotal%5D=5170&data%5Bterms%5D%5Bpv%5D=74&data%5Btransactions%5D%5Bitems%5D%5B0%5D%5BbillToAddress%5D%5Baddress1%5D=194++%E0%B8%AB%E0%B8%A1%E0%B8%B9%E0%B9%88+8++%E0%B8%96.%E0%B8%8A%E0%B8%A1%E0%B8%90%E0%B8%B5%E0%B8%A3%E0%B8%B0%E0%B9%80%E0%B8%A7%E0%B8%8A%E0%B9%83%E0%B8%95%E0%B9%89&data%5Btransactions%5D%5Bitems%5D%5B0%5D%5BbillToAddress%5D%5Baddress2%5D=%E0%B8%95.%E0%B8%AB%E0%B8%99%E0%B8%AD%E0%B8%87%E0%B8%9E%E0%B8%A2%E0%B8%AD%E0%B8%A1+%E0%B8%AD.%E0%B8%95%E0%B8%B0%E0%B8%9E%E0%B8%B2%E0%B8%99%E0%B8%AB%E0%B8%B1%E0%B8%99&data%5Btransactions%5D%5Bitems%5D%5B0%5D%5BbillToAddress%5D%5Bcity%5D=%E0%B8%9E%E0%B8%B4%E0%B8%88%E0%B8%B4%E0%B8%95%E0%B8%A3&data%5Btransactions%5D%5Bitems%5D%5B0%5D%5BbillToAddress%5D%5Bzip%5D=66110&data%5Btransactions%5D%5Bitems%5D%5B0%5D%5BbillToAddress%5D%5Bcountry%5D=TH&data%5Btransactions%5D%5Bitems%5D%5B0%5D%5BbillToName%5D%5BfullName%5D=Chutikan+Pongsawang&data%5Btransactions%5D%5Bitems%5D%5B0%5D%5BbillToPhone%5D=0906959045&data%5Btransactions%5D%5Bitems%5D%5B0%5D%5BmethodDetails%5D%5Bpayer%5D=Chutikan+Pongsawang&data%5Btransactions%5D%5Bitems%5D%5B0%5D%5Bamount%5D=5170&data%5Btransactions%5D%5Bitems%5D%5B0%5D%5Bauthorization%5D=&data%5Btransactions%5D%5Bitems%5D%5B0%5D%5Btype%5D=record&data%5Btransactions%5D%5Baggregate%5D%5Bamount%5D=5170&data%5Bcreator%5D%5BhumanName%5D%5BfullName%5D=*ms&data%5Bcurrency%5D=THB&data%5Bcustomer%5D%5Bid%5D%5Bunicity%5D=201786666&data%5Bcustomer%5D%5BtaxTerms%5D%5BtaxId%5D=3660400235896&data%5Bcustomer%5D%5Bhref%5D=https%3A%2F%2Fhydra.unicity.net%2Fv5a%2Fcustomers%2Fc3fbb1e4ab746c814c085a8e6fcb92abb4412be26e768a32b28f2d8f1fc7ead4&data%5BfulfillmentStatus%5D=Fulfilled&data%5Binvoice%5D%5Bid%5D%5Bunicity%5D=6465850&data%5Binvoice%5D%5Bhref%5D=https%3A%2F%2Fhydra.unicity.net%2Fv5a%2Forders%2F31512d2a1d4a2a5860bc785d27d1f7522ad2ddc6de4667f07aa6ac036f67662c%2Finvoice&data%5Blines%5D%5Bitems%5D%5B0%5D%5Bitem%5D%5Bid%5D%5Bunicity%5D=19852&data%5Blines%5D%5Bitems%5D%5B0%5D%5Bitem%5D%5Bhref%5D=https%3A%2F%2Fhydra.unicity.net%2Fv5a%2Fitems%2F21d4c81c327191b6be5024635ab575d1&data%5Blines%5D%5Bitems%5D%5B0%5D%5BcatalogSlide%5D%5Bcontent%5D%5Bdescription%5D=Coffee+Mix+(Bio+Reishi+Brand)&data%5Blines%5D%5Bitems%5D%5B0%5D%5Bterms%5D%5BpriceEach%5D=310&data%5Blines%5D%5Bitems%5D%5B0%5D%5Bterms%5D%5BpvEach%5D=3&data%5Blines%5D%5Bitems%5D%5B0%5D%5Bterms%5D%5BtaxablePriceEach%5D=289.72&data%5Blines%5D%5Bitems%5D%5B0%5D%5Bterms%5D%5Btax%5D%5Baggregate%5D%5Bamount%5D=40.56&data%5Blines%5D%5Bitems%5D%5B0%5D%5Bterms%5D%5Btax%5D%5Bamount%5D=20.28&data%5Blines%5D%5Bitems%5D%5B0%5D%5Bterms%5D%5Btax%5D%5Bpercentage%5D=7&data%5Blines%5D%5Bitems%5D%5B0%5D%5Bquantity%5D=2&data%5Blines%5D%5Bitems%5D%5B0%5D%5BquantityDetails%5D%5BquantityBackordered%5D=0&data%5Blines%5D%5Bitems%5D%5B1%5D%5Bitem%5D%5Bid%5D%5Bunicity%5D=19236&data%5Blines%5D%5Bitems%5D%5B1%5D%5Bitem%5D%5Bhref%5D=https%3A%2F%2Fhydra.unicity.net%2Fv5a%2Fitems%2F92c00b12d7e8f2ef58b48e011c766a79&data%5Blines%5D%5Bitems%5D%5B1%5D%5BcatalogSlide%5D%5Bcontent%5D%5Bdescription%5D=Super+Chlorophyll+Powder+TH&data%5Blines%5D%5Bitems%5D%5B1%5D%5Bterms%5D%5BpriceEach%5D=665&data%5Blines%5D%5Bitems%5D%5B1%5D%5Bterms%5D%5BpvEach%5D=12&data%5Blines%5D%5Bitems%5D%5B1%5D%5Bterms%5D%5BtaxablePriceEach%5D=621.5&data%5Blines%5D%5Bitems%5D%5B1%5D%5Bterms%5D%5Btax%5D%5Baggregate%5D%5Bamount%5D=87&data%5Blines%5D%5Bitems%5D%5B1%5D%5Bterms%5D%5Btax%5D%5Bamount%5D=43.5&data%5Blines%5D%5Bitems%5D%5B1%5D%5Bterms%5D%5Btax%5D%5Bpercentage%5D=7&data%5Blines%5D%5Bitems%5D%5B1%5D%5Bquantity%5D=2&data%5Blines%5D%5Bitems%5D%5B1%5D%5BquantityDetails%5D%5BquantityBackordered%5D=0&data%5Blines%5D%5Bitems%5D%5B2%5D%5Bitem%5D%5Bid%5D%5Bunicity%5D=24726&data%5Blines%5D%5Bitems%5D%5B2%5D%5Bitem%5D%5Bhref%5D=https%3A%2F%2Fhydra.unicity.net%2Fv5a%2Fitems%2Fae188df4a1a9abf0c579cd4becb7b5aa&data%5Blines%5D%5Bitems%5D%5B2%5D%5BcatalogSlide%5D%5Bcontent%5D%5Bdescription%5D=Bio-C+300+TH&data%5Blines%5D%5Bitems%5D%5B2%5D%5Bterms%5D%5BpriceEach%5D=790&data%5Blines%5D%5Bitems%5D%5B2%5D%5Bterms%5D%5BpvEach%5D=10&data%5Blines%5D%5Bitems%5D%5B2%5D%5Bterms%5D%5BtaxablePriceEach%5D=738.32&data%5Blines%5D%5Bitems%5D%5B2%5D%5Bterms%5D%5Btax%5D%5Baggregate%5D%5Bamount%5D=103.36&data%5Blines%5D%5Bitems%5D%5B2%5D%5Bterms%5D%5Btax%5D%5Bamount%5D=51.68&data%5Blines%5D%5Bitems%5D%5B2%5D%5Bterms%5D%5Btax%5D%5Bpercentage%5D=7&data%5Blines%5D%5Bitems%5D%5B2%5D%5Bquantity%5D=2&data%5Blines%5D%5Bitems%5D%5B2%5D%5BquantityDetails%5D%5BquantityBackordered%5D=0&data%5Blines%5D%5Bitems%5D%5B3%5D%5Bitem%5D%5Bid%5D%5Bunicity%5D=31334&data%5Blines%5D%5Bitems%5D%5B3%5D%5Bitem%5D%5Bhref%5D=https%3A%2F%2Fhydra.unicity.net%2Fv5a%2Fitems%2F733f074159b14c7029c387dc9308e14b&data%5Blines%5D%5Bitems%5D%5B3%5D%5BcatalogSlide%5D%5Bcontent%5D%5Bdescription%5D=Core+H+TH&data%5Blines%5D%5Bitems%5D%5B3%5D%5Bterms%5D%5BpriceEach%5D=820&data%5Blines%5D%5Bitems%5D%5B3%5D%5Bterms%5D%5BpvEach%5D=12&data%5Blines%5D%5Bitems%5D%5B3%5D%5Bterms%5D%5BtaxablePriceEach%5D=766.36&data%5Blines%5D%5Bitems%5D%5B3%5D%5Bterms%5D%5Btax%5D%5Baggregate%5D%5Bamount%5D=107.28&data%5Blines%5D%5Bitems%5D%5B3%5D%5Bterms%5D%5Btax%5D%5Bamount%5D=53.64&data%5Blines%5D%5Bitems%5D%5B3%5D%5Bterms%5D%5Btax%5D%5Bpercentage%5D=7&data%5Blines%5D%5Bitems%5D%5B3%5D%5Bquantity%5D=2&data%5Blines%5D%5Bitems%5D%5B3%5D%5BquantityDetails%5D%5BquantityBackordered%5D=0&data%5Bmarket%5D=TH&data%5BdateCreated%5D=2021-09-22T23%3A35%3A38-05%3A00&data%5Bid%5D%5Bunicity%5D=66-423182123&data%5Bid%5D%5Blabel%5D=423182123&data%5Bnotes%5D=shopping%7Cdsc%7Cpc+web%7Ctha%7C%7C201786666%7C&data%5BpaymentStatus%5D=Paid&data%5BshipToAddress%5D%5Baddress1%5D=114%2F4+Green+Plus+Mall+2+Chiangmai+Business+Park+Moo+4&data%5BshipToAddress%5D%5Baddress2%5D=T.Nongpakhrang++A.Mueang&data%5BshipToAddress%5D%5Bcity%5D=Chiangmai&data%5BshipToAddress%5D%5Bstate%5D=&data%5BshipToAddress%5D%5Bzip%5D=50000&data%5BshipToAddress%5D%5Bcountry%5D=TH&data%5BshipToEmail%5D=ball_unicity%40hotmail.com&data%5BshippingMethod%5D%5Btype%5D=DSC&data%5BshippingMethod%5D%5Blocation%5D=Unicity+Marketing+(Thailand)+Co%2C+Ltd.++Branch%2300002&data%5BshipToName%5D%5BfirstName%5D=Unicity&data%5BshipToName%5D%5BlastName%5D=Marketing+(Thailand)+Co%2C+Ltd.+Branch%2300002&data%5BshipToName%5D%5BfullName%5D=Unicity+Marketing+(Thailand)+Co%2C+Ltd.+Branch%2300002&data%5BshipToName%5D%5BfullName%40th%5D=Unicity+Marketing+(Thailand)+Co%2C+Ltd.+Branch%2300002&data%5BshipToPhone%5D=052007177&data%5Bhref%5D=https%3A%2F%2Fhydra.unicity.net%2Fv5a%2Forders%2F31512d2a1d4a2a5860bc785d27d1f7522ad2ddc6de4667f07aa6ac036f67662c";
      // * Getting order id from getOpenOrderId API - 203
      barcodeItems =
          await MemberCallsService.init().getBarcodeItems(data);
      isLoading.toggle();
    } catch (err) {
      isLoading.toggle();
      LoggerService.instance.e(err.toString());
    }
  }
}
