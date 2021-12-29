import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utilities/enums.dart';
import '../../../../../global/theme/text_view.dart';

class BankWirePaymentOption extends StatelessWidget {
  const BankWirePaymentOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PaymentInfoRow(
            title: "Mizuho Bank Aoyama Branch:",
            value: "2583367"), //! hardcoded
        const SizedBox(
          height: 10,
        ),
        const PaymentInfoRow(
            title:
                "Sumitomo Mitsui Banking Corporation Marunouchi Branch:", //! hardcoded
            value: "1166789"),
        const SizedBox(
          height: 10,
        ),
        const PaymentInfoRow(
            title: "Bank of Tokyo-Mitsubishi UFJ Aoyama Branch:", //! hardcoded
            value: "4592289"),
        const SizedBox(
          height: 10,
        ),
        const PaymentInfoRow(
            title: "Yucho Bank Transfer Gaienmae Post Office:", //! hardcoded
            value: "00100 9 126835"),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Divider(height: 1),
        ),
        AppText(
            text: "fill_or_enter_your_membe_before_name_of_transferee."
                .tr,
            style: TextTypes.caption,
            align: TextAlign.center),
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
