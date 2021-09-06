import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderSuccess extends StatelessWidget {
  final bool isSuccess;
  final String distributorId;
  final String poNumber;

  const OrderSuccess({this.isSuccess = true, this.distributorId = "", this.poNumber = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order Success",
          style: TextStyle(color: Color(0xFF000000)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                "Thank You",
                style: TextStyle(fontSize: 24, color: Color(0xFF000000)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                "Your order has been placed successfully!",
                style: TextStyle(fontSize: 14, color: Color(0xFF505050)),
              ),
            ),
            const SizedBox(height: 55),
            SvgPicture.asset(isSuccess ? kOrderSuccessImage : kOrderWaringImage,
                height: 232, semanticsLabel: "Add PO"),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                "Distributor ID : $distributorId",
                style: const TextStyle(fontSize: 14, color: Color(0xFF384250)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                "PO Number: $poNumber",
                style: const TextStyle(fontSize: 14, color: Color(0xFF384250)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
