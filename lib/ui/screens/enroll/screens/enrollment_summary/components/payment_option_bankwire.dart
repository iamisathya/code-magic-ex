import '../../../../../global/theme/text_view.dart';
import '../../../../../../utilities/enums.dart';
import 'package:flutter/material.dart';

class BankWirePaymentOption extends StatelessWidget {
  const BankWirePaymentOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        PaymentInfoRow(
            title: "Mizuho Bank Aoyama Branch:",
            value: "2583367"),
        SizedBox(
          height: 10,
        ),
        PaymentInfoRow(
            title: "Sumitomo Mitsui Banking Corporation Marunouchi Branch:",
            value: "1166789"),
        SizedBox(
          height: 10,
        ),
        PaymentInfoRow(
            title: "Bank of Tokyo-Mitsubishi UFJ Aoyama Branch:",
            value: "4592289"),
        SizedBox(
          height: 10,
        ),
        PaymentInfoRow(
            title: "Yucho Bank Transfer Gaienmae Post Office:",
            value: "00100 9 126835"),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Divider(height: 1),
        ),
        AppText(
            text:
                "Please be sure to fill in or enter your member number before the name of the transferee.",
            style: TextTypes.caption, align: TextAlign.center),
      ],
    );
  }
}

class PaymentInfoRow extends StatelessWidget {
  const PaymentInfoRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: AppText(text: title, style: TextTypes.caption),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: AppText(text: value, style: TextTypes.subtitle1),
        ),
      ],
    );
  }
}
