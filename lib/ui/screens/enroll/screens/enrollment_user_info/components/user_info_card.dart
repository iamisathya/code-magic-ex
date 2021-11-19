import 'package:flutter/material.dart';

import '../../../../../../utilities/enums.dart';
import '../../../../../global/theme/text_view.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    Key? key,
    required this.id,
    required this.nativeName,
    required this.name,
    required this.title,
  }) : super(key: key);

  final String id;
  final String nativeName;
  final String name;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: const Color(0xFFFFFFFF)),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 10,
                    color: const Color(0xFF505050),
                  ),
            ),
            AppText(
                text: id,
                style: TextTypes.subtitle1,
                color: const Color(0xFF384250)),
            AppText(
                text: name,
                style: TextTypes.bodyText1,
                maxLines: 1,
                color: const Color(0xFF384250)),
            Text(
              nativeName,
              maxLines: 1,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 10,
                    color: const Color(0xFF384250),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
