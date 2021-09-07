import 'package:flutter/material.dart';

class GrandTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF4D7483),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Container(
            decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(3.0))),
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                  child: Text(
                    "Grand Total Price:",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: const Color(0xFF000000)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                  child: Text(
                    "35,487,935 THB",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: const Color(0xFF000000)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
              decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(3.0))),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 13),
                    child: Text(
                      "Grand Total PV:",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: const Color(0xFF000000)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 13),
                    child: Text(
                      "560,436 PV",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: const Color(0xFF000000)),
                    ),
                  ),
                ],
              )),
        ]),
      ),
    );
  }
}
