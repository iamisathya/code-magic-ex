import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/globals.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      color: AppColor.crayola,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 30, bottom: 10, right: 30),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    height: 40,
                    child: Center(
                        child: Text(
                      Globals.userId,
                      style: const TextStyle(
                          color: AppColor.manatee, fontSize: 14),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    height: 40,
                    child: Center(
                        child: Text(
                      DateFormat('dd-MM-yyyy')
                          .format(DateTime.now())
                          .toString(),
                      style: const TextStyle(
                          color: AppColor.manatee, fontSize: 14),
                    )),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 20, right: 30),
            child: Container(
              width: double.infinity,
              color: Colors.white,
              height: 40,
              child: Center(
                  child: Text(
                Globals.userInfo.humanName.fullName,
                style: const TextStyle(color: AppColor.manatee, fontSize: 14),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
