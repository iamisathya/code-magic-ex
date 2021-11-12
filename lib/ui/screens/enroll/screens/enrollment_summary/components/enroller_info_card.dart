import 'package:flutter/material.dart';

import 'each_info_row.dart';

class EnrollerInfoCard extends StatelessWidget {
  const EnrollerInfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 20),
        child: Column(
          children: const [
            EeachUserinfoItem(
                title: "Enroller",
                value: "108357166 Saoirse Worcestershire, ฏิญฐ์ ฌิฎฌื่ณ"),
            EeachUserinfoItem(
                title: "Sponsor",
                value: "108357166 Saoirse Worcestershire, ฏิญฐ์ ฌิฎฌื่ณ"),
            EeachUserinfoItem(title: "PV Month", value: "2021-09"),
            EeachUserinfoItem(title: "Government ID", value: "3760100515642"),
            EeachUserinfoItem(title: "Gender", value: "Female"),
            EeachUserinfoItem(title: "Marital Status", value: "Single"),
            EeachUserinfoItem(title: "Birthday", value: "05 Aug 1997"),
          ],
        ),
      ),
    );
  }
}
