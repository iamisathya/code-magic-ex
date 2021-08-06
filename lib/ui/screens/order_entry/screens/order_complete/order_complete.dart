import 'package:code_magic_ex/api/api_address.dart';
import 'package:code_magic_ex/utilities/user_session.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../constants/colors.dart';
import '../../../../../ui/global/widgets/transparent_app_bar.dart';
import '../../../../../utilities/size_config.dart';
import 'components/body.dart';

class OrderComplete extends StatelessWidget {
  static const String routeName = '/orderComplete';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackground,
      appBar: TransAppBar(
          title: "Order Complete", action: _renderActionBar(context)),
      body: SafeArea(child: Body()),
    );
  }

  List<Widget> _renderActionBar(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(
          Icons.qr_code_2_outlined,
        ),
        tooltip: 'open qr code',
        onPressed: () => canLaunch(
            "${Address.baseDscTh}/barcode/?href=31512d2a1d4a2a5860bc785d27d1f752ef2a0cd919b417e7899c79ae4fc690d6&token=${UserSessionManager.shared.customerToken}&user=${UserSessionManager.shared.userInfo!.id.unicity}"),
      ),
    ];
  }
}
