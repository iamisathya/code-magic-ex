import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  final Color bgColor;
  const TotalPrice({ this.bgColor = const Color(0xFFF5F5F5)});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Total PV:",
                  style: TextStyle(fontSize: 14, color: Color(0xFF384250)),
                ),
                Text(
                  "40 PV",
                  style: TextStyle(fontSize: 14, color: Color(0xFF384250)),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(
                height: 1,
                color: Color(0xFFD0D0CF),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Total Price:",
                  style: TextStyle(fontSize: 14, color: Color(0xFF384250)),
                ),
                Text(
                  "6,000 THB",
                  style: TextStyle(fontSize: 14, color: Color(0xFF384250)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
