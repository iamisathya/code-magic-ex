import 'package:flutter/material.dart';

import 'each_info_row.dart';

class ShippingAddressCard extends StatelessWidget {
  const ShippingAddressCard({
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
                title: "Name",
                value:
                    "Patthiraya Preedakulthanawatภัทร์ฐิรญา ปรีดากุลธนวัฒน์"),
            EeachUserinfoItem(
                title: "Address",
                value:
                    "18 Soi Lat Phrao 83 Lat Phrao Rd Khlong Chao Khun Sing, Wang Thonglang Bangkok 10310"),
            EeachUserinfoItem(title: "Mobile Number", value: "094-636-1222"),
            EeachUserinfoItem(title: "Email", value: "patthiraya@gmail.com"),
          ],
        ),
      ),
    );
  }
}
