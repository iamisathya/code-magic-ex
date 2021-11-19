import '../../../../../global/theme/text_view.dart';
import '../../../../../../utilities/enums.dart';
import '../../../../../../utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EnrolmentSuccessScreen extends StatelessWidget {
  final String distributorId;
  final String poNumber;

  const EnrolmentSuccessScreen({this.distributorId = "", this.poNumber = ""});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: AppText(text: "Thank You", style: TextTypes.headline4),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: AppText(
                    text: "Your order has been placed successfully!",
                    style: TextTypes.bodyText1,
                    color: Color(0xFF505050)),
              ),
            ],
          ),
          SvgPicture.asset(kEnrolmentSuccessImage,
              height: 232, semanticsLabel: "Enrolment success!"),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: AppText(
                  text: "Distributor ID : $distributorId",
                  style: TextTypes.bodyText1,
                  color: const Color(0xFF384250),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: AppText(
                  text: "PO Number: $poNumber",
                  style: TextTypes.bodyText1,
                  color: const Color(0xFF384250),
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: AppText(
                  text: "Scan Barcode",
                  style: TextTypes.bodyText1,
                  color: Color(0xFF384250),
                ),
              ),
              SvgPicture.asset(kScanBarCodeImage),
            ],
          ),
        ],
      ),
    );
  }
}
