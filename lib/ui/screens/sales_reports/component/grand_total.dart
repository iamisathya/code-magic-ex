import 'package:flutter/material.dart';

import '../../../../constants/globals.dart';

class GrandTotal extends StatelessWidget {
  final String totalPrice;
  final String totalPv;
  final String status;

  const GrandTotal(
      {required this.totalPrice, required this.totalPv, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
          decoration: BoxDecoration(
              color: status == "Unknown"
                  ? const Color(0xFFFFE7EB)
                  : const Color(0xFFF1FAF7), //FFE7EB error color
              borderRadius: const BorderRadius.all(Radius.circular(3.0))),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Price:",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: const Color(0xFF000000)),
              ),
              Text(
                "$totalPrice ${Globals.currency}",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: const Color(0xFF000000)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
          decoration: BoxDecoration(
              color: status == "Unknown"
                  ? const Color(0xFFFFE7EB)
                  : const Color(0xFFF1FAF7), //FFE7EB error color
              borderRadius: const BorderRadius.all(Radius.circular(3.0))),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total PV:",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: const Color(0xFF000000)),
              ),
              Text(
                "$totalPv PV",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: const Color(0xFF000000)),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
