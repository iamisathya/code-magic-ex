import 'package:flutter/material.dart';

import '../../../../../../constants/colors.dart';
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
            color: AppColor.kWhiteColor),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontSize: 10, color: AppColor.darkLiver),
            ),
            AppText(
                text: id, style: TextTypes.subtitle1, color: AppColor.charcoal),
            AppText(
                text: name,
                style: TextTypes.bodyText1,
                maxLines: 1,
                color: AppColor.charcoal),
            Text(
              nativeName,
              maxLines: 1,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 10,
                    color: AppColor.charcoal,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
