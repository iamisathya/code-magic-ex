import 'package:dsc_tools/constants/globals.dart';
import 'package:dsc_tools/models/easy_ship_reports.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:flutter/material.dart';
import '../../../../utilities/extensions.dart';

class EasyShipItem extends StatelessWidget {
  final int index;
  final EasyShipReports item;

  const EasyShipItem({required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 122),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color(0x66191c1f),
              blurRadius: 1,
            ),
          ],
          color: Colors.white.withOpacity(0.65),
        ),
        child: Row(children: [
          SizedBox(
            width: 80,
            child: Column(children: [
              const AppText(text: "4", style: TextTypes.headline6),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: AppText(
                  text: item.pvDate.asMMM,
                  style: TextTypes.headline4,
                  color: const Color(0xFFFFBF3A),
                ),
              ),
              AppText(
                text: item.pvDate.asYYYY,
                style: TextTypes.caption,
                color: const Color(0xFF505050),
              ),
            ]),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(text: item.name, style: TextTypes.headline6),
                    AppText(text: "Code: ${item.itemName}", style: TextTypes.bodyText2),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: "Order Number ${item.pvDate.asMMM}",
                      style: TextTypes.bodyText2,
                      color: const Color(0xFF505050),
                    ),
                  ),
                ),
                Container(
                  height: 33,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: const Color(0xFFF6F9FD),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: "Total PV: ${item.pv.toString()} PV",
                        style: TextTypes.caption,
                        color: const Color(0xFF505050),
                      ),
                      AppText(
                        text: "Total Price: ${item.totalPrice} ${Globals.currency}",
                        style: TextTypes.caption,
                        color: const Color(0xFF505050),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
