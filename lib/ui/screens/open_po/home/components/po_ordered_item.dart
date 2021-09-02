import 'package:flutter/material.dart';

class PoOrderedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: const Color(0xFFF1FAF7),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      color: const Color(0xFFD0D0CF),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    height: 40,
                    child: const Center(
                        child: Text(
                      "Item 02",
                      style: TextStyle(color: Color(0xFF384250), fontSize: 14),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    height: 40,
                    child: const Center(
                        child: Text(
                      "17762",
                      style: TextStyle(color: Color(0xFF9999A4), fontSize: 14),
                    )),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: const Center(
                        child: Text(
                      "	เดลี่ โปรดิวส์",
                      style: TextStyle(color: Color(0xFF9999A4), fontSize: 14),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: const Center(
                        child: Text(
                      "0001",
                      style: TextStyle(color: Color(0xFF9999A4), fontSize: 14),
                    )),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: const Center(
                        child: Text(
                      "25 PV | 1,590 THB",
                      style: TextStyle(color: Color(0xFF9999A4), fontSize: 14),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    height: 40,
                    child: const Center(
                        child: Text(
                      "1",
                      style: TextStyle(color: Color(0xFF9999A4), fontSize: 14),
                    )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
